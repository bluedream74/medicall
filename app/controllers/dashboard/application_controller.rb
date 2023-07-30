class Dashboard::ApplicationController < ApplicationController
  before_action :authenticate_user!

  helper_method :current_clinic

  def current_clinic
    @current_clinic ||= current_user.clinics.first
  end

  private

    def after_sign_in_path_for(resource)
      dashboard_clinic_path
    end
end
