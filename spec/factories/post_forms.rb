FactoryBot.define do
  factory :post_form do
    title           {Faker::Lorem.characters(number: 50)}
    text            {Faker::Lorem.characters(number: 2000)}
    address         {Faker::Lorem.characters(number:200)}
    budget          {Faker::Number.number(digits: 10)}
    category_id     {Faker::Number.between(from: 1, to: 11)}
    area_id         {Faker::Number.between(from: 1, to: 8)}
    opening_hour_id {Faker::Number.between(from:1, to: 9)}
    tag_name        {Faker::Lorem.characters(number: 10)}
  end

end
