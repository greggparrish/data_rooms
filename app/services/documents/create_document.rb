class Documents::CreateDocument
  include Service

  attr_accessor :params, :current_user

  def initialize(user, params)
    @current_user = user
    @params = params
  end

  def call
    # Create new doc, call doc_permissions, if project/s, call CreateAsset
    document = Document.new(params)
    document.user_id = @current_user.id

    if document.save
      Documents::CreateDocPermissions.call(@current_user,document)
      unless document.assets.empty?
        Documents::SetAssetPermissions.call(@current_user,document)
      end
    end
    document
  end
end
