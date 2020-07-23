FactoryBot.define do
  factory :account do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    role { 0 }
  end

  factory :admin_account, parent: :account do
    role { Account.roles[:admin] }
  end
end
