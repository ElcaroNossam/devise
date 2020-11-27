class Appointment < ApplicationRecord
     
    belongs_to :user
     
      has_many :doctor_appointments
      has_many :doctors, through: :doctor_appointments

      
    
 
end
