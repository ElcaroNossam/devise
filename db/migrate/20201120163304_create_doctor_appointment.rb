class CreateDoctorAppointment < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_appointments do |t|
      t.integer :doctor_id
      t.integer :appointment_id
    end
  end
end
