FactoryBot.define do
  factory :post_form do
    title           { Faker::Lorem.characters(number: 50) }
    text            { Faker::Lorem.characters(number: 2000) }
    address         { Faker::Lorem.characters(number: 200) }
    budget          { Faker::Number.within(range: 0..9_999_999) }
    category_id     { Faker::Number.between(from: 1, to: 11) }
    area_id         { Faker::Number.between(from: 1, to: 8) }
    opening_hour_id { Faker::Number.between(from: 1, to: 9) }
  end
end
