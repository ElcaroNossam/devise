FactoryBot.define do

    factory :appointment do
      id {1}
      user_id {1}
      data {"38050"}
      content {"password"}
      stock_id { 1}
      # Add additional fields as required via your User model
      after(:create) do |appointment|
        appointment.update(active: true)
      end
    end
  end
  
