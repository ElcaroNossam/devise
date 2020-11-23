FactoryBot.define do
    factory :user do
      id {1}
      email {"test@user.com"}
      name {"agent@i.ua"}
      number {"38050"}
      password {"password"}
      password_confirmation { password }
      # Add additional fields as required via your User model
      after(:create) do |user|
        user.stocks.update(active: true)
      end
    end
end