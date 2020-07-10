FactoryBot.define do
  factory :account do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
