class IssueItemComponent < ViewComponent::Base
  with_collection_parameter :issue
  delegate :id, :summary, :work, :status, to: :issue
  attr_reader :issue

  def initialize(issue:)
    @issue = issue
  end

  def created_ago
    time_ago_in_words(issue.created_at) + " ago"
  end

  def username
    issue.account.username
  end
end
