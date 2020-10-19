FactoryBot.define do
  factory :issues_event, class: "Issues::Event" do
    action { "comment" }
  end
end
