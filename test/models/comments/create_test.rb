require "test_helper"

module Comments
  class CreateTest < ActiveSupport::TestCase
    test "can create comment" do
      commentator_account = create(:account)
      project = create(:project, lead: create(:account))
      issue = create(:project_issue, project: project, account: create(:account))
      comment = create(:comment, commentable: issue, account: commentator_account, words: "first")

      assert_equal issue, comment.commentable
      assert_equal commentator_account, comment.account
      assert_equal "first", comment.words.to_plain_text
    end
  end
end
