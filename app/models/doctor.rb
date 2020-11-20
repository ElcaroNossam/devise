class Doctor < ApplicationRecord
    has_many :doctor_categories
    has_many :categories, through: :doctor_categories
    has_secure_password
end
