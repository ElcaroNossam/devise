require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
    
    # Add this
    login
    categories
    let(:valid_attributes) {
        { :doctor_id => 1, :category_id => 1 }
    }

    describe "GET #index" do
    
        it "returns a success response" do
          
            DoctorCategory.create! valid_attributes
            get :index, params: {}

            # Make sure to swap this as well
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

end