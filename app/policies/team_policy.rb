class TeamPolicy
attr_reader :user, :team
  def initialize(user, team)
    @user = user
    @team = team
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.joins(:memberships).where(memberships: {user_id: user})
    end
  end

  def show?
    @team.memberships.exists?(user_id: user)
  end

  def update?
    @team.memberships.exists?(['user_id = ? AND abilities <= ?', @user, "1" ])
  end

  def destroy?
    @team.memberships.exists?(['user_id = ? AND abilities = ?', @user, "0" ])
  end

end
