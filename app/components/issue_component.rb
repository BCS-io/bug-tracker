class IssueComponent < ViewComponent::Base
  include ApplicationHelper
  include Pundit
  delegate :id, :summary, :work, :status, to: :issue
  attr_reader :issue, :account

  def initialize(issue:, account:)
    @issue = issue
    @account = account
  end

  def pundit_user
    account
  end

  def created_ago
    time_ago_in_words(issue.created_at) + " ago"
  end

  def username
    issue.account.username
  end
end
