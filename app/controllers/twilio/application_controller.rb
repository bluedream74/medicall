class Twilio::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def current_clinic
    @current_clinic ||= Clinic.find_by!(twilio_phone_number: params[:To])
  end
end
