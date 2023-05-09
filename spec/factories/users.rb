FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 5) }
    profile               { Faker::Lorem.characters(number: 150) }
  end
end