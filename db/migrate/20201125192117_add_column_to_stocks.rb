class AddColumnToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :picture, :string
  end
end
