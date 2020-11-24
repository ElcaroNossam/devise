class Stock < ApplicationRecord

    

    def self.check_db(app)
        where(appointment_id: app).first
    end

end