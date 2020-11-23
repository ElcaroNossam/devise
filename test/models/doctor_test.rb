require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  
  def setup
    @doctor = doctors(:one)
    @stock = @doctor.stocks.build(user_id: 1, appointment_id: 1, content: "Lorem ipsum", namedoctor: "Bumbelby")
  end
 

  test "should be valid" do
    assert @stock.valid?
  end

  test "doctor id should be present" do
    @stock.doctor_id = nil
    assert @stock.valid?
  end
 
 
 
end
