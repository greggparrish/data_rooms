class DocumentPolicy
attr_reader :user, :document
  def initialize(user, document)
    @user = user
    @document = document
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.joins(:doc_permissions).where(doc_permissions: {user_id: user})
    end
  end

  def show?
    @document.doc_permissions.exists?(user_id: user)
  end

  def update?
    @document.doc_permissions.exists?(['user_id = ? AND abilities <= ?', @user, "1" ])
  end
end
