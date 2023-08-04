class ApplicationController < ActionController::Base
  private

    def after_sign_in_path_for(resource)
      new_dashboard_clinic_path
    end
end
