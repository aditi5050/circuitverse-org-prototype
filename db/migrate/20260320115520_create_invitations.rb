class CreateInvitations < ActiveRecord::Migration[8.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :organization, null: false, foreign_key: true
      t.integer :role
      t.string :token

      t.timestamps
    end
  end
end
