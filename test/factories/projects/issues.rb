FactoryBot.define do
  factory :project_issue, class: "Issue" do
    work { rand(Issue.works.count) }
    summary { rand(1..3).times.map { Faker::Company.catch_phrase }.join(" ").capitalize }
    status { rand(Issue.statuses.count) }
  end
end
