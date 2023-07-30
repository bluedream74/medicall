class Dashboard::WelcomeController < Dashboard::ApplicationController
  def show
    return redirect_to new_dashboard_clinic_path if current_clinic.blank?
  end
end
