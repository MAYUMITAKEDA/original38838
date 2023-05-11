FactoryBot.define do
  factory :post do
    title           {Faker::Lorem.characters(number: 50)}
    text            {Faker::Lorem.characters(number: 2000)}
    address         {Faker::Lorem.characters(number: 200)}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    budget_id       {Faker::Number.between(from: 2, to: 9)}
    opening_hour_id {Faker::Number.between(from:3, to: 9)}

    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
