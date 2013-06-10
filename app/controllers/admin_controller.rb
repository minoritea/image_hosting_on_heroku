class AdminController < ApplicationController
  before_filter :authenticate_user!
  def index
    render :index
  end
  def root
    redirect_to '/admin'
  end
end
