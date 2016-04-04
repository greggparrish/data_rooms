class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = @user.stakeholders.order('created_at desc').limit(2)
    @documents = current_user.doc_permissions.order('created_at desc').limit(8)
  end
end
