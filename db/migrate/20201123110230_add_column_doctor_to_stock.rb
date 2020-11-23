class AddColumnDoctorToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :doctor_id, :integer
  end
end
