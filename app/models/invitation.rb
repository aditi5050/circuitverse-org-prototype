class Invitation < ApplicationRecord
  belongs_to :organization

  enum :role, { student: 0, instructor: 1, group_lead: 2 }

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end