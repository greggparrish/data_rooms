class Folders::CreateFolder
  include Service

  attr_accessor :params, :current_user

  def initialize(user, params)
    @current_user = user
    @params = params
  end

  def call
    # Create new doc, call doc_permissions, if project/s, call CreateAsset
    folder = Folder.new(params)
    folder.created_by = @current_user.id

    if folder.save
      Folders::AddDocumentsToFolder.call(@current_user,folder)
    end
    folder
  end
end
