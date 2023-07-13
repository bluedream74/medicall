class ClinicWizardController < ApplicationController

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      current_user.clinics << @clinic
      7.times do 
        @clinic.schedules.build(session: '午前')
        @clinic.schedules.build(session: '午後')
      end
      render :edit
    else
      render :new
    end
  end
  

  def edit
    @clinic = Clinic.includes(:schedules).find(params[:id])
  end

  def edit_info
    @clinic = Clinic.find(params[:id])
    render 'clinic_wizard/edit'
  end 

  def update_info
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to account_dashboard_path, notice: "更新しました"
    else
      render :edit
    end
  end


  def update
    @clinic = Clinic.find(params[:id])

    if @clinic.update(clinic_params)
      if params[:commit] == '最終確認'
        redirect_to complete_clinic_wizard_path
      else
        render :next_step
      end
    else
      render :edit
    end
  end

  private

  def clinic_params
    params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve, schedules_attributes: [:day_of_week, :session, :start_time, :end_time])
  end


end
