FactoryBot.define do
  factory :project do
    sequence :name do |n|
      Faker::App.unique.name + "_#{n}" # faker has no minimum length
    end
    key { Faker::Name.unique.initials(number: 4) }
    description { Faker::Company.catch_phrase }
  end
end
