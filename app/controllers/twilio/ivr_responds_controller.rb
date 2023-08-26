#rubocop:todo all
class Twilio::IvrRespondsController < Twilio::ApplicationController
  def create
    response = if params["Digits"]
                 case params["Digits"]
                 when "1"
                   Twilio::TwiML::VoiceResponse.new do |r|
                     r.say(message: "You selected sales. Good for you!")
                   end.to_s
                 when "2"
                   Twilio::TwiML::VoiceResponse.new do |r|
                     r.say(message: "You need support. We will help!")
                   end.to_s
                 else
                   Twilio::TwiML::VoiceResponse.new do |r|
                     r.say(message: "Sorry, I don't understand that choice.")
                     r.pause
                     r.redirect("/twilio/welcome")
                   end.to_s
                 end
               else
                 Twilio::TwiML::VoiceResponse.new do |r|
                   r.redirect("/twilio/welcome")
                 end.to_s
               end

    render xml: response, content_type: "text/xml"
  end
end
