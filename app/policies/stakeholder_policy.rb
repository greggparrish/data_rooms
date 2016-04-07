class StakeholderPolicy
attr_reader :user, :document
  def initialize(user, document)
    @user = user
    @project = document
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      #scope.joins(:doc_permissions).where(doc_permissions: {user_id: user})
    end
  end

end
