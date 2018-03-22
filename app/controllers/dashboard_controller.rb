class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @user = current_user
    @assets = policy_scope(Asset).approved.group_by(&:project).take(2)
    @documents = policy_scope(Document).limit(10)
  end
end
