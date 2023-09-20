class Dashboard::WelcomeController < Dashboard::ApplicationController
  layout "admin", only: [:list, :payment]

  def show
    return redirect_to new_dashboard_clinic_path if current_clinic.blank?

    redirect_to dashboard_clinic_path(current_clinic)
  end

  def list
  end

  def payment
  end
end
