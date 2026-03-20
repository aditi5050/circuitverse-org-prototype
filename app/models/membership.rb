class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

<<<<<<< HEAD
 enum :role, { student: 0, instructor: 1, group_lead: 2, org_admin: 3 }
=======
 enum :role, { student: 0, instructor: 1, org_admin: 2 }
>>>>>>> 1e4ef15e289f6f182fe051153f4d6fb7fa3915d0
end