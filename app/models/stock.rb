class Stock < ApplicationRecord
    attr_accessor :picture
    
    belongs_to :doctor
   
    
    mount_uploader :picture, StockUploader

    def self.check_db(app)
        where(appointment_id: app).first
    end

end