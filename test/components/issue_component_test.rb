require "test_helper"

class IssueComponentTest < ViewComponent::TestCase
  test "renders expected view" do
    travel(-5.days)
    lead = create(:account, username: "JohnDoe")
    project = create(:project, lead: lead)
    issue_owner_account = create(:account, username: "JaneSmith")
    issue = create(:project_issue, project: project, account: issue_owner_account)
    travel_back

    render_inline(IssueComponent.new(issue: issue, account: lead))

    assert_text("5 days ago")
    assert_text("by JaneSmith")
    assert_no_text("JohnDoe")
  end

  test "with permission it can edit issue" do
    lead = create(:account, username: "JohnDoe")
    project = create(:project, lead: lead)
    issue_owner_account = create(:account, username: "JaneSmith")
    issue = create(:project_issue, project: project, account: issue_owner_account)

    render_inline(IssueComponent.new(issue: issue, account: lead))

    assert_text("by JaneSmith")
    assert_no_text("JohnDoe")
    assert_text("Edit")
  end

  test "with no permission it cannot edit issue" do
    current_account = create(:account, username: "current_account")
    lead = create(:account, username: "JohnDoe")
    project = create(:project, lead: lead)
    issue_owner_account = create(:account, username: "JaneSmith")
    issue = create(:project_issue, project: project, account: issue_owner_account)

    render_inline(IssueComponent.new(issue: issue, account: current_account))

    assert_text("by JaneSmith")
    assert_no_text("current_account")
    assert_no_text("Edit")
  end
end
