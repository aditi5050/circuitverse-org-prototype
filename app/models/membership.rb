class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

 enum :role, { student: 0, instructor: 1, org_admin: 2 }
end