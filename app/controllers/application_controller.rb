class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # private

  #   def after_sign_in_path_for(resource)
  #     dashboard_clinic_path
  #   end
end
