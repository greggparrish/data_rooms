class DashboardPolicy
attr_reader :user, :document
  def initialize(user)
    @user = user
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

  def destroy?
    @document.doc_permissions.exists?(['user_id = ? AND abilities = ?', @user, "0" ])
  end

  def download?
    @document.doc_permissions.exists?(['user_id = ? AND abilities <= ?', @user, "2" ])
  end

end
