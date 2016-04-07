class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @user = current_user
    @documents = policy_scope(Document).order('created_at desc').limit(8)
    @projects = policy_scope(Project).order('created_at desc').limit(2)
  end
end
