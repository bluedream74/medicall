class Dashboard::ClinicsController < Dashboard::ApplicationController
  before_action :set_clinic, only: [:edit, :update, :add_customer, :create_customer, :customer_index, :edit_customer, :update_customer, :edit_schedule]

  layout "dashboard/clinic/application", only: [:show, :edit]

  def show
  end

  def new
    @clinic = current_user.clinics.build
  end

  def edit
  end

  def create
    @clinic = current_user.clinics.build

    if @clinic.save && (@clinic.users << current_user)
      @clinic_program = @clinic.clinic_programs.build
      redirect_to dashboard_clinic_step1_path(@clinic), notice: "クリニックが作成されました。"
      # render "wizard/step1", locals: { form: @clinic_program }, notice: "クリニックが作成されました。"
    else
      render :new
    end
  end

  def update
    if current_clinic.update(clinic_params)
      redirect_to dashboard_clinic_account_path(current_clinic), notice: "更新しました"
    else
      render :edit
    end
  end

  private

    def clinic_params
      params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve,
                                     schedules_attributes: [:id, :day_of_week, :session, :start_time, :end_time, :_destroy])
    end
end
