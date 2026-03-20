class CreateGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
