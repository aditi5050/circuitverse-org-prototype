class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum :role, { student: 0, instructor: 1, group_lead: 2, org_admin: 3 }
end