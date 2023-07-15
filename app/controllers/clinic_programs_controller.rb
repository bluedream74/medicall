class ClinicProgramsController < ApplicationController
  before_action :set_clinic

  def new
    @clinic_program = @clinic.clinic_programs.build
  end

  def create
    @clinic_program = @clinic.clinic_programs.build(clinic_program_params)
    if @clinic_program.save
      redirect_to account_dashboard_path, notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end


  def edit
    @clinic = Clinic.find(params[:clinic_id])
    @clinic_program = @clinic.clinic_programs.find(params[:id])
  end

  def update
  end

  def destroy
    @clinic_program = @clinic.clinic_programs.find(params[:id])
    @clinic_program.destroy
    redirect_to account_dashboard_path, notice: 'Schedule was successfully deleted.'
  end
  
  
  

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end


  def clinic_program_params
    params.require(:clinic_program).permit(:start_time, :end_time, weekdays: [])
  end
  
  
  
  
  
end
