class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: [:customer_index, :account, :show]

  def show
    @clinic = current_user.clinics.first
    render layout: 'admin'
  end

  def account

    @clinic = current_user.clinics.first
    @user = current_user
    @clinics = @user.clinics
    
    render layout: 'admin'
  end

  private
  def set_clinic
    @clinic = Clinic.find(params[:id]) if params[:id]
  end
end
