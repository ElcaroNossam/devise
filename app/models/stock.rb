class Stock < ApplicationRecord

    belongs_to :doctor

    def self.check_db(app)
        where(appointment_id: app).first
    end

end