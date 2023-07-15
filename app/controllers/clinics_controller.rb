class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:edit, :update, :add_customer, :create_customer, :customer_index, :edit_customer, :update_customer, :edit_schedule]
  before_action :check_if_already_registered, only: [:new]

  layout "admin", except: [:new]

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

  def customer_index
    @customers = @clinic.customers
  end

  def add_customer
    @customer = Customer.new
  end

  def create_customer
    @customer = Customer.new(customer_params)
    if @customer.save
      @clinic.clinic_customers.create!(customer: @customer)
      redirect_to customer_index_clinic_path(@clinic), notice: "電話帳に登録されました。"
    else
      render :add_customer
    end
  end

  def edit_customer
    @clinic = Clinic.find(params[:id])
    @customer = @clinic.customers.find(params[:customer_id])
  end

  def update_customer
    @customer = @clinic.customers.find(params[:customer_id])
    if @customer.update(customer_params)
      redirect_to customer_index_clinic_path(@clinic), notice: "患者情報が更新されました。"
    else
      Rails.logger.debug @customer.errors.full_messages
      render :edit_customer
    end
  end

  def destroy_customer
    @clinic = Clinic.find(params[:id])
    @customer = Customer.find(params[:customer_id])

    @clinic.customers.destroy(@customer)

    redirect_to customer_index_clinic_path(@clinic), notice: "削除しました"
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

    def customer_params
      params.require(:customer).permit(:phone_number, :patient_number, :name, :list_type)
    end
end
