class Folders::CreateFolder
  include Service

  attr_accessor :params, :project, :current_user

  def initialize(user, project, params)
    @current_user = user
    @project = project
    @params = params
  end

  def call
    folder = Folder.new(params)
    folder.created_by = @current_user.id
    folder.save
    folder
  end
end
