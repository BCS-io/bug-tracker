Issue.delete_all
Project.delete_all
Account.delete_all

MULTIPLIER = 10
MAX_PROJECTS = 3 * MULTIPLIER
MAX_DAYS_AGO = 100
MAX_PROJECT_ISSUES = 5 * MULTIPLIER
MAX_PROJECT_ISSUE_COMMENTS = 20 * MULTIPLIER

Account.create!([
  {email: "admin@example.com", username: "admin", password: "password", password_confirmation: "password", role: 1},
  {email: "rich@example.com", username: "Rich", password: "password", password_confirmation: "password"},
  {email: "other@example.com", username: "Other", password: "password", password_confirmation: "password"}
])

MAX_PROJECTS.times do
  account = Account.order(Arel.sql("RANDOM()")).first
  project_created = rand(0...MAX_DAYS_AGO)
  FactoryBot.create(:project, lead: account, created_at: project_created.days.ago)

  rand(0...MAX_PROJECT_ISSUES).times do
    project = Project.order(Arel.sql("RANDOM()")).first
    account = Account.order(Arel.sql("RANDOM()")).first
    issue_created = rand(0...project_created)
    FactoryBot.create(:project_issue,
      project: project,
      account: account,
      created_at: issue_created.days.ago)
  end

  rand(0...MAX_PROJECT_ISSUE_COMMENTS).times do
    issue = Issue.order(Arel.sql("RANDOM()")).first
    account = Account.order(Arel.sql("RANDOM()")).first
    comment = FactoryBot.create(:comment, account: account, commentable: issue)
    issue.events.create(eventable: comment, action: "projects_issues_comments")
  end
end
