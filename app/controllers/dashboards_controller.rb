class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:account, :show, :sample]
  before_action :first_clinic

  include SchedulesHelper
  

  def show
    if @clinic.nil?
      redirect_to new_clinic_path, notice: "まずはクリニックの基本情報を登録してください。"
    else
      render layout: "admin"
    end
  end

  def account
    @user = current_user
    @clinics = @user.clinics

    @clinic_programs = @clinic.clinic_programs

    render layout: "admin"
  end

  def sample
    render layout: "admin"
  end

  def calls
    render layout: "admin"
  end

  def rule
    render layout: "admin"
  end

  def call_show
    render layout: "admin"
  end

  def payment
    render layout: "admin"
  end

  def list
    render layout: "admin"
  end
  
  private

    def first_clinic
      @clinic = current_user.clinics.first
    end

    def set_clinic
      @clinic = Clinic.find(params[:id]) if params[:id]
    end
end
