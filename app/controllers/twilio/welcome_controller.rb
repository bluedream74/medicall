#rubocop:todo all

class Twilio::WelcomeController < Twilio::ApplicationController
  def ivr_welcome
    response = Twilio::TwiML::VoiceResponse.new {|r|
      r.gather(numDigits: 1, action: "/twilio/menu_selection") do |g|
        g.say(message: "お電話ありがとうございます。〇〇クリニックです。webでの予約の方は1、お問い合わせ、及び電話予約の方は2、営業の方は3を押してください。", language: "ja-JP")
      end
      # If the user doesn't enter input, loop
      r.redirect("/twilio/welcome")
    }.to_s

    # response = Twilio::TwiML::VoiceResponse.new {|r| r.say(message: "今、ツウィリオのテスト中です。#{current_clinic.twilio_phone_number}", language: "ja-JP") }.to_s

    render xml: response, content_type: "text/xml"
  end
end
