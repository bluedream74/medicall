#rubocop:todo all
class Twilio::IvrRespondsController < Twilio::ApplicationController
  before_action :find_clinic, only: [:menu_selection, :inquiry_selection_menu]

  def menu_selection
    if params["Digits"]
      case params["Digits"]
      when "1"
        # reservation system
        if @clinic.reserve.present?
          twiml_say("オンライン予約を行うためのリンクをSMSで送信します。", true)
          send_message()
        else
          # non reservation system
          twiml_say("当クリニックではネット予約システムを導入しておりません。 メニューからその他のオプションを選択してください。", false, true)
        end
      when "2"
        inquiries()
      when "3"
        twiml_say("クリニックでは業務の妨げとなりますので、仕事上の電話はメールでお願い致します。 ご要望をメールで info@clinic.jp までお送りください。", true)
      else
        twiml_say("申し訳ありませんが、その選択は理解できません。", false, true)
      end
    else
      twiml_say("", false, true) # loops back to main menu
    end
  end

  # clinic iquires
  def inquiries
    inquires_list = @clinic.ivr_rule.items.where(category: "voice_guidance").pluck(:name).uniq rescue nil
    message = ""

    if (inquires_list.present?)
      inquires_list.each_with_index do |value, index|
        message += "Press #{index + 1} for #{value}. "
      end

      response = Twilio::TwiML::VoiceResponse.new
      response.gather(num_digits: '1', action: '/twilio/inquiry_selection_menu') do |gather|
        gather.say(message: message, voice: 'Polly.Amy', language: 'ja-JP', loop: 1)
      end

      render xml: response.to_s

    # no inquires rules
    else
      # no inquires_list forward call to clinic number 
      if @clinic.tel
        twiml_say("電話をクリニックに転送します。 お待ちください。")
        twiml_dialog(@clinic.tel)
      else
        twiml_say("返答はありません。 後でもう一度試してください。", true)
      end
    end
  end

  def inquiry_selection_menu
    inquires_list = @clinic.ivr_rule.items.where(category: "voice_guidance").pluck(:name).uniq rescue nil

    if (params["Digits"] && inquires_list[params["Digits"].to_i - 1].present?)
      inquiry_name = inquires_list[params["Digits"].to_i - 1]
      inquiry_rule = @clinic.ivr_rule.items.where(name: inquiry_name).first
      twiml_say(inquiry_rule.body) if (inquiry_rule.body.present?) # if message then read message

      # transfer call if number present
      if (inquiry_rule.transfer_phone_number.present?)
        twiml_dial(inquiry_rule.transfer_phone_number)
      else
        # hanging up when not transferring
        response = Twilio::TwiML::VoiceResponse.new
        response.hangup
      end
    else
      twiml_say("申し訳ありませんが、その選択は理解できません。", false, true) # loops back to main menu
    end
  end


  # answer msg
  def twiml_say(phrase, exit = false, loop_back=false)
    if (phrase.present?)
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: phrase, voice: 'Polly.Amy', language: 'ja-JP')
    end

    if (exit == true)
      response.say(message: "お電話頂きありがとうございます。")
      response.hangup
    elsif (loop_back == true)
      response.redirect("/twilio/welcome")
    end

    render xml: response.to_s
  end

  # transfer call to
  def twiml_dial(number)
    response = Twilio::TwiML::VoiceResponse.new
    response.dial(caller_id: params['To']) do |dial|
      dial.number(number)
    end
    response.say(message: '連絡できません。')

    render xml: response.to_s
  end

  # send msg to recipient
  def send_message()
    caller_number = params['From']
    twilio_number = params['To']

    @client = Twilio::REST::Client.new
    @client.messages.create(
      body: "予約するにはこのリンクをクリックしてください。 #{@clinic.reserve}",
      from: twilio_number,
      to: caller_number
    )
  end

  private
  # find clinic
  def find_clinic
    @clinic = Clinic.find_by(twilio_phone_number: params['To']) || nil
    twiml_say("正しい番号をダイヤルしてください。", true) if @clinic.nil?
  end
end
