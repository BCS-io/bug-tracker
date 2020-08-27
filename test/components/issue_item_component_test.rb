require "test_helper"

class IssueItemComponentTest < ViewComponent::TestCase
  test "renders expected view" do
    travel(-5.days)
    lead = create(:account, username: "JohnDoe")
    project = create(:project, lead: lead)
    account = create(:account, username: "JaneSmith")
    issue = create(:project_issue, project: project, account: account)
    travel_back

    render_inline(IssueItemComponent.new(issue: issue))

    assert_text("5 days ago")
    assert_text("by JaneSmith")
    assert_no_text("JohnDoe")
  end
end
