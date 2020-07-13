Project.delete_all
Account.delete_all

MULTIPLIER = 10
MAX_PROJECTS = 3 * MULTIPLIER
MAX_DAYS_AGO = 100

Account.create!([
  {email: "admin@example.com", username: "admin", password: "password", password_confirmation: "password", role: 1},
  {email: "rich@example.com", username: "Rich", password: "password", password_confirmation: "password"},
  {email: "other@example.com", username: "Other", password: "password", password_confirmation: "password"}
])

MAX_PROJECTS.times do
  account = Account.order(Arel.sql("RANDOM()")).first
  project_created = rand(0...MAX_DAYS_AGO)
  FactoryBot.create(:project, lead: account, created_at: project_created.days.ago)
end
