FactoryBot.define do
  factory :comment do
    user_id 1
    body 'Test comment'
    rating 4
  end

  factory :product do
    name "Test Bike"
    description "Best Bike"
    image_url "mbx.jpg"
    color "black"
    price "1200"
  end
end
