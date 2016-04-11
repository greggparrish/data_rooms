class Documents::CreateDocPermissions
  include Service

  attr_accessor :current_user, :document

  def initialize(user, document)
    @current_user = user
    @document = document
  end

  def call
    permissions = document.doc_permissions.create(user_id: @current_user.id, abilities: 0, expires: Time.zone.parse('2099-01-01 21:00'))
    permissions.save
    permissions
  end
end

