class Dashboard::Clinic::CustomersController < Dashboard::Clinic::ApplicationController
  def index
    @customers = current_clinic.customers
  end

  def new
    @customer = current_clinic.customers.build
  end

  def edit
    @customer = current_clinic.customers.find(params[:id])
  end

  def create
    @customer = current_clinic.customers.build(customer_params)

    if @customer.save
      redirect_to dashboard_clinic_customers_path(current_clinic), notice: "電話帳に登録されました。"
    else
      render :new
    end
  end

  def update
    @customer = current_clinic.customers.find(params[:id])
    if @customer.update(customer_params)
      redirect_to dashboard_clinic_customers_path(current_clinic), notice: "患者情報が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @customer = current_clinic.customers.find(params[:id])
    @customer.destroy!
    redirect_to dashboard_clinic_customers_path(current_clinic), notice: "削除しました"
  end

  private

    def customer_params
      params.require(:customer).permit(:phone_number, :patient_number, :name, :list_type)
    end
end
