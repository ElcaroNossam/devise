FactoryBot.define do

    factory :doctor_category do
      
      doctor_id {1}
      category_id { 1}
      # Add additional fields as required via your User model
      after(:create) do |dc|
        dc.update(active: true)
      end
    end
  end
  