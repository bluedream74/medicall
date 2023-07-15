class ClinicProgramsController < ApplicationController
  before_action :set_clinic

  layout 'admin'

  def new
    @clinic_program = @clinic.clinic_programs.build
  end

  def create
    @clinic_program = @clinic.clinic_programs.build(clinic_program_params)
    if @clinic_program.save
      redirect_to account_dashboard_path, notice: '登録しました'
    else
      render :new
    end
  end


  def edit
    @clinic = Clinic.find(params[:clinic_id])
    @clinic_program = @clinic.clinic_programs.find(params[:id])
  end

  def update
    @clinic_program = @clinic.clinic_programs.find(params[:id])
  
    if @clinic_program.update(clinic_program_params)
      redirect_to account_dashboard_path, notice: '更新しました'
    else
      render :edit
    end
  end
  

  def destroy
    @clinic_program = @clinic.clinic_programs.find(params[:id])
    @clinic_program.destroy
    redirect_to account_dashboard_path, notice: '削除しました'
  end
  

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end


  def clinic_program_params
    params.require(:clinic_program).permit(:start_time, :end_time, weekdays: [])
  end
  
  
  
  
  
end
