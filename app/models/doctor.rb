class Doctor < ApplicationRecord
    
    has_many :stocks

    has_many :doctor_categories
    has_many :categories, through: :doctor_categories

    has_many :doctor_appointments
    has_many :appointments, through: :doctor_appointments

    validates :number, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
    validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
    has_secure_password
end
