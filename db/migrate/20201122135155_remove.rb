class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :roles_mask, :integer
    remove_column :users, :role, :string

    add_column :users, :roles_mask, :integer
    

  end
end
