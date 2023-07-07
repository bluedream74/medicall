class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:edit, :update, :add_customer, :create_customer, :customer_index]
  before_action :check_if_already_registered, only: [:new, :create]

  layout 'admin'


  def new
    @clinic = Clinic.new
  end

  def edit
  end

  def create
    @clinic = Clinic.new(clinic_params)
  
    respond_to do |format|
      if @clinic.save
        # ユーザーとクリニックの関連付けを行う
        current_user.clinics << @clinic
  
        format.html { redirect_to dashboard_path, notice: 'クリニックが無事に登録されました。' }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to account_dashboard_path, notice: '更新しました'
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
      @clinic.clinic_customers.create(customer: @customer)
      redirect_to @clinic, notice: 'Customer was successfully created.'
    else
      render :add_customer
    end
  end


  private
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def check_if_already_registered
      if current_user.clinics.exists?
        redirect_to dashboard_account_path, notice: 'すでにクリニックを登録されています。'
      end
    end

    def clinic_params
      params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve)
    end

    def customer_params
      params.require(:customer).permit(:phone_number, :patient_number, :name, :is_white_list, :is_black_list)
    end
end
