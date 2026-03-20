class AddLogoToOrganizations < ActiveRecord::Migration[8.1]
  def change
    add_column :organizations, :logo_url, :string
  end
end
