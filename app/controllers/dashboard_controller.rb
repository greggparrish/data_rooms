class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @user = current_user
    @assets = policy_scope(Asset).group_by(&:project)
    @documents = policy_scope(Document).order('created_at DESC').limit(10)
  end
end
