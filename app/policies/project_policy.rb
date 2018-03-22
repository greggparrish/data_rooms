class ProjectPolicy
attr_reader :user, :project
  def initialize(user, project)
    @user = user
    @project = project
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.joins(:stakeholders).where(stakeholders: {user_id: user})
    end
  end

  def show?
    @project.stakeholders.exists?(user_id: user)
  end

  def destroy?
    @project.stakeholders.exists?(['user_id = ? AND abilities = ?', @user, "0" ])
  end

  def update?
    @project.stakeholders.exists?(['user_id = ? AND abilities <= ?', @user, "2" ])
  end
end
