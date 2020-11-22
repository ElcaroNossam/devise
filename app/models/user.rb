class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :stocks
         has_many :appointments
         
         validates :number, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
         validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
                      
                      
                      
              ROLES = %i[user admin] 
                      def roles=(roles) 
                        roles = [*roles].map { |r| r.to_sym }
                        self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
                       end
                     
                       def roles 
                        ROLES.reject do |r|
                          ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
                         end
                       end
                     
                       def has_role?(role) 
                         roles.include?(role)
                       end
                     

  def recomende?
    stocks.where(appointment_id: nil)                
   end
end
