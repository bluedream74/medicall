class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:customer_index, :account, :show]

  include SchedulesHelper

  def show
    @clinic = current_user.clinics.first

    if @clinic.nil?
      redirect_to new_clinic_path, notice: 'You must create a clinic first.'
    else
      render layout: 'admin'
    end
  end

  def account

    @clinic = current_user.clinics.first
    @user = current_user
    @clinics = @user.clinics
    @schedules = Schedule.where(clinic_id: @clinic.id)
    @matrix = schedule_matrix(@schedules)
    
    render layout: 'admin'
  end

  private
  def set_clinic
    @clinic = Clinic.find(params[:id]) if params[:id]
  end
end
