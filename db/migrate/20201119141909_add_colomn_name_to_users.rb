class AddColomnNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number, :int
    add_column :users, :name, :string
  end
end
