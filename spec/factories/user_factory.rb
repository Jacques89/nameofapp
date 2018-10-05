FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email "peter@example.com"
        password "test456"
        first_name "Jacques"
        last_name "Nalletamby"
        admin false
  end

  factory :admin, class: User do
    email
    password "test 456"
    admin true
    first_name "Jacques"
    last_name "Nalletamby"
  end
end
