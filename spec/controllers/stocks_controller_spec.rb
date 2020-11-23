require 'rails_helper'

RSpec.describe StocksController, type: :controller do

    # Add this
    login_user
    login
    let(:valid_attributes) {
        { :content => "Test title!", :namedoctor => "Descrip", :doctor_id => 1, :user_id => 1, :appointment_id => 1, }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Stock.create! valid_attributes
            get :index, params: {}, session: valid_session

            # Make sure to swap this as well
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end
end

