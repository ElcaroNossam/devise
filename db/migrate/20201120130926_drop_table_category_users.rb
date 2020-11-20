class DropTableCategoryUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :category_users
  end
end
