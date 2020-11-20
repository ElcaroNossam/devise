class Appointment < ApplicationRecord
     has_many :doctor_appointments
     has_many :doctors, through: :doctor_appointments
end
