class Dashboard::ApplicationController < ApplicationController
  before_action :authenticate_user!

  helper_method :current_clinic

  def current_clinic
    @current_clinic ||= current_user.clinics.first
  end
end
