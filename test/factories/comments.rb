FactoryBot.define do
  factory :comment do
    words { Faker::Company.catch_phrase }
  end
end
