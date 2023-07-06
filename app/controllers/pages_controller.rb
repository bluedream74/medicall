class PagesController < ApplicationController
  def home
  end

  def sample
    render layout: 'admin'
  end
end
