class Dashboard::Clinic::ClinicProgramsController < Dashboard::Clinic::ApplicationController
  def new
    @clinic_program = current_clinic.clinic_programs.build
  end

  def edit
    @clinic_program = current_clinic.clinic_programs.find(params[:id])
  end

  def create
    @clinic_program = current_clinic.clinic_programs.build(clinic_program_params)

    if @clinic_program.save
      redirect_to dashboard_clinic_account_path(current_clinic), notice: "電話帳に登録されました。"
    else
      render :new
    end
  end

  def update
    @clinic_program = current_clinic.clinic_programs.find(params[:id])
    if @clinic_program.update(clinic_program_params)
      redirect_to dashboard_clinic_account_path(current_clinic), notice: "患者情報が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @clinic_program = current_clinic.clinic_programs.find(params[:id])
    @clinic_program.destroy!
    redirect_to dashboard_clinic_account_path(current_clinic), notice: "削除しました"
  end

  private

    def clinic_program_params
      params.require(:clinic_program).permit(:start_time, :end_time, weekdays: [])
    end
end
