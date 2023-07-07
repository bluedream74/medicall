class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:edit, :update]

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
  
        format.html { redirect_to @clinic, notice: 'Clinic was successfully created.' }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to @clinic, notice: '更新しました'
    else
      render :edit
    end
  end


  private
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def clinic_params
      params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve)
    end
end
