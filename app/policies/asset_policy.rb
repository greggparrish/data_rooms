class AssetPolicy
attr_reader :user, :document
  def initialize(user, document)
    @user = user
    @document = document
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.joins(document: :doc_permissions).where(doc_permissions: {user_id: user})
    end
  end

end
