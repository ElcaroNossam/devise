class AddRolesMaskToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :roles_mask, :integer
  end
end
