class DashboardsController < ApplicationController
	before_action :authenticate_user!
  include DashboardsHelper

  def index
    if !current_user.is_admin
      redirect_to root_path
    end
    @orders = Order.all
  end
end
