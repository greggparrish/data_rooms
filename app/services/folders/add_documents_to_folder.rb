class Folders::AddDocumentsToFolder
  include Service

  attr_accessor :params, :current_user

  def initialize(user, params)
    @current_user = user
    @params = params
  end

  def call
  end
end
