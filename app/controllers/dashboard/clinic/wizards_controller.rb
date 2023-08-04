class Dashboard::Clinic::WizardsController < Dashboard::Clinic::ApplicationController
  layout "dashboard/application"
  def step1
    @clinic_program = current_clinic.clinic_programs.build
  end

  def step1_create
    @clinic_program = current_clinic.clinic_programs.build(clinic_program_params)

    if @clinic_program.save
      render "step2", notice: "登録が完了しました。"
    else
      render "step1"
    end
  end

  def step2
    @clinic_program = current_clinic.clinic_programs.build
  end

  def step2_create
    @clinic_program = current_clinic.clinic_programs.build(clinic_program_params)

    if @clinic_program.save
      render "complete", notice: "登録が完了しました。"
    else
      render "step2"
    end
  end

  def complete
  end

  private

    def clinic_program_params
      params.require(:clinic_program).permit(:start_time, :end_time, weekdays: [])
    end
end
