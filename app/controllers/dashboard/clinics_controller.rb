class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:edit, :update, :add_customer, :create_customer, :customer_index, :edit_customer, :update_customer, :edit_schedule]
  before_action :check_if_already_registered, only: [:new]

  # layout "admin", except: [:new]

  def new
    @clinic = Clinic.new
  end

  def edit
  end

  def edit_schedule
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to account_dashboard_path, notice: "更新しました"
    else
      render :edit
    end
  end

  private

    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def check_if_already_registered
      if current_user.clinics.exists?
        redirect_to dashboard_account_path, notice: "すでにクリニックを登録されています。"
      end
    end

    def clinic_params
      params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve,
                                     schedules_attributes: [:id, :day_of_week, :session, :start_time, :end_time, :_destroy])
    end
end
