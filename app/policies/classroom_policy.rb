class ClassroomPolicy < ApplicationPolicy
  def create?
    membership = user.memberships.find_by(
      organization: record.group.organization
    )

<<<<<<< HEAD
    membership&.org_admin? ||
    membership&.group_lead? ||
    membership&.instructor?
=======
    membership&.org_admin? || membership&.instructor?
>>>>>>> 1e4ef15e289f6f182fe051153f4d6fb7fa3915d0
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end