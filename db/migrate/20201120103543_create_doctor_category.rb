class CreateDoctorCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_categories do |t|

      t.integer :doctor_id
      t.integer :category_id
    end
  end
end
