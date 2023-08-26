class Dashboard::Clinic::AccountsController < Dashboard::Clinic::ApplicationController
  def show
    @clinic = current_user.clinics.first
    @user = current_user
    @clinics = @user.clinics

    @clinic_programs = @clinic.clinic_programs

    # render layout: "admin"
  end
end
