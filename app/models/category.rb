class Category < ApplicationRecord

has_many :category_users
has_many :users, through: :category_users

validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }

end
