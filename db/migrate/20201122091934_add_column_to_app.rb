class AddColumnToApp < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :appointment_id, :string
    add_column :appointments, :stock_id, :string
  end
end
