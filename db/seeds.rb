Project.delete_all
Account.delete_all

Account.create!([
  {email: "admin@example.com", username: "admin", password: "password", password_confirmation: "password", role: 1},
  {email: "rich@example.com", username: "Rich", password: "password", password_confirmation: "password"},
  {email: "other@example.com", username: "Other", password: "password", password_confirmation: "password"}
])

30.times do
  account = Account.order(Arel.sql("RANDOM()")).first
  FactoryBot.create(:project, lead: account)
end
