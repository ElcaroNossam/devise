class CreateAppointment < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.string  :data
      t.string :content
      t.timestamps
    end
  end
end
