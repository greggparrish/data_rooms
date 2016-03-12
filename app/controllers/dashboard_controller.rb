class DashboardController < ApplicationController
  before_action :authenticate_user!

  def landing
    @user = current_user
    @projects = @user.stakeholders
    @documents = current_user.permissions.order('created_at desc').limit(8)
  end

end
