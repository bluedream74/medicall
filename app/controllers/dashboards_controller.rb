class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    render layout: 'admin'
  end
end
