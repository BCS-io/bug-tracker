FactoryBot.define do
  factory :account do
    transient do
      name { Faker::Internet.unique.username }
    end

    username { name }
    email { Faker::Internet.safe_email(name: name) }
    password { "password" }
    password_confirmation { password }
    role { Account.roles[:user] }
  end

  factory :admin_account, parent: :account do
    role { Account.roles[:admin] }
  end
end
