class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def show?
    project.stakeholder.user?
  end
end

