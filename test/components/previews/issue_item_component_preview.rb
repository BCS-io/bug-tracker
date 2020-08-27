class IssueItemComponentPreview < ViewComponent::Preview
  include FactoryBot::Syntax::Methods

  def by_default
    account = create(:account)
    project = create(:project, lead: account)
    issue = create(:project_issue, project: project)

    render(IssueItemComponent.new(issue: issue))
  end
end
