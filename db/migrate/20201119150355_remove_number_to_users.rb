class RemoveNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :number, :int
    add_column :users, :number, :string
  end
end
