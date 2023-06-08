FactoryBot.define do
  factory :post do
    title           { 'Example Title' }
    text            { 'aaaaaaaaaaaaa' }
    budget          { 1000 }
    category_id     { 1 }
    area_id         { 1 }
    opening_hour_id { 1 }
    address         { 'bbbbbbbbbbbbb' }

    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
