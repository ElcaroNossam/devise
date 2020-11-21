class AddColumnToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :namedoctor, :string
  end
end
