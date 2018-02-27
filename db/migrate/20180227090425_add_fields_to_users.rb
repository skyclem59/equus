class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :telephone, :integer
    add_column :users, :niveau, :string
    add_column :users, :licence, :string
    add_column :users, :assurance, :string
    add_column :users, :admin, :boolean
  end
end
