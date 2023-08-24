#rubocop:todo all

class Twilio::WelcomeController < Twilio::ApplicationController
  def create
    response = Twilio::TwiML::VoiceResponse.new {|r|
      r.gather(numDigits: 1, action: "/twilio/ivr_responds") do |g|
        g.say(message: "For sales, press 1. For support, press 2.")
      end
      # If the user doesn't enter input, loop
      r.redirect("/twilio/welcome")
    }.to_s

    # response = Twilio::TwiML::VoiceResponse.new {|r| r.say(message: "今、ツウィリオのテスト中です。#{current_clinic.twilio_phone_number}", language: "ja-JP") }.to_s

    render xml: response, content_type: "text/xml"
  end
end
