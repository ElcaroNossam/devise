class Category < ApplicationRecord

has_many :doctor_categories
has_many :doctors, through: :doctor_categories

validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }

end
