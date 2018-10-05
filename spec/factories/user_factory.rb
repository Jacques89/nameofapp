FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email "peter@example.com"
        password "1234567890"
        first_name "Peter"
        last_name "Example"
        admin false
  end
end
