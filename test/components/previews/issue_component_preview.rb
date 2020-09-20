class IssueComponentPreview < ViewComponent::Preview
  include FactoryBot::Syntax::Methods

  def can_edit
    account = create(:account)
    project = create(:project, lead: account)
    issue = create(:project_issue, project: project, account: account)

    render(IssueComponent.new(issue: issue, account: account))
  end

  def cannot_edit
    current_account = create(:account)
    project = create(:project, lead: create(:account))
    issue = create(:project_issue, project: project, account: create(:account))

    render(IssueComponent.new(issue: issue, account: current_account))
  end
end
