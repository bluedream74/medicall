class ClinicWizardController < ApplicationController

  include ClinicProgramsHelper


  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      current_user.clinics << @clinic
      @clinic_program = @clinic.clinic_programs.build
      render 'clinic_wizard/step1', locals: { form: @clinic_program }, notice: "クリニックが作成されました。"
    end
  end


  def step1
    @clinic = Clinic.find(params[:id])
    @clinic_program = @clinic.clinic_programs.find(params[:id])
  end

  def step2
    @clinic = Clinic.find(params[:id])
    @clinic_program = @clinic.clinic_programs.find(params[:id])
  end

  def edit
  end


  def edit_info
    @clinic = Clinic.find(params[:id])
    @clinic_program = @clinic.clinic_programs.build(clinic_program_params)
    if @clinic_program.save
      render 'clinic_wizard/step2', locals: { form: @clinic_program }, notice: "登録が完了しました。"
    else
      render :edit
    end
  end 

  def update_info
    @clinic = Clinic.find(params[:id])
    @clinic_program = @clinic.clinic_programs.new(clinic_program_params)
    
    if @clinic_program.save
      redirect_to complete_clinic_wizard_path(id: @clinic.id), notice: "登録が完了しました。"
    else
      render :edit
    end
  end

  def complete
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])

    if @clinic.update(clinic_params)
      if params[:commit] == "最終確認"
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
    params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve)
  end

  def clinic_program_params
    params.require(:clinic_program).permit(:start_time, :end_time, weekdays: [])
  end


end
