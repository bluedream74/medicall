class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
  end

  def sample
    render layout: "admin"
  end
end
