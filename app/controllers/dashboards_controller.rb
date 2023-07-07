class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    render layout: 'admin'
  end

  def account
    
    @user = current_user
    @clinics = @user.clinics
    
    render layout: 'admin'
  end
end
