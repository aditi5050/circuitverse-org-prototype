class ClassroomPolicy < ApplicationPolicy
  def create?
    membership = user.memberships.find_by(
      organization: record.group.organization
    )

    membership&.org_admin? ||
    membership&.group_lead? ||
    membership&.instructor?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end