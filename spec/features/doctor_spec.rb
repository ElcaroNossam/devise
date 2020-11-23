describe Doctor do

      let!(:doctor) { create(:doctor, number: "38051",  password: "password") }
  
  
    before(:each) do
      login_url("38051", "password") 
    end

    
  end
 