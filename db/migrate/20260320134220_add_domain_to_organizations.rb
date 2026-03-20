class AddDomainToOrganizations < ActiveRecord::Migration[8.1]
  def change
    add_column :organizations, :domain, :string
  end
end
