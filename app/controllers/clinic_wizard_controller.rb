class ClinicWizardController < ApplicationController
  include Wicked::Wizard

  steps :clinic_info, :schedule_info

  layout 'admin'

  def show
    @clinic = Clinic.find(params[:clinic_id])
    render_wizard
  end


  def update_clinic_info
    @clinic = Clinic.find(params[:clinic][:id])
    @clinic.update(clinic_params)

    if @clinic.schedule_info_complete?
      redirect_to account_dashboard_path(@clinic)
    else
      render_wizard @clinic
    end
  end

  def update_schedule
    @clinic = Clinic.find(params[:clinic][:clinic_id])
    if @clinic.update(schedule_params)
      redirect_to account_dashboard_path(@clinic)
    else
      render_wizard @clinic
    end
  end

  def finish_wizard_path
    clinic_path(@clinic)
  end
  

  private

  def clinic_params
    params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve, :clinic_id, schedules_attributes: [:day, :start_time])
  end

  def schedule_params
    params.require(:clinic).permit(schedules_attributes: [:day_of_week, :session, :start_time, :end_time, :id])
  end
  
  
end
