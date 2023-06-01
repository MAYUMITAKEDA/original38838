FactoryBot.define do
  factory :post do
    title           { Faker::Lorem.characters(number: 50) }
    text            { Faker::Lorem.characters(number: 2000) }
    address         { Faker::Lorem.characters(number: 200) }
    budget          { Faker::Number.number(digits: 10) }
    category_id     { Faker::Number.between(from: 1, to: 11) }
    area_id         { Faker::Number.between(from: 1, to: 8) }
    opening_hour_id { Faker::Number.between(from: 1, to: 9) }

    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
