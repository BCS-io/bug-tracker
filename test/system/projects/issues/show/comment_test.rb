require "application_system_test_case"

module Projects
  module Issues
    module Show
      class CommentTest < ApplicationSystemTestCase
        test "adds a comment" do
          account = create(:account)
          project = create(:project, lead: account)
          issue = create(:project_issue,
            project: project,
            account: account,
            summary: "show issue")

          sign_in account
          visit project_issues_url(project)
          click_on "show issue"

          assert_current_path issue_path(issue)
          find("#editor").click.set("comment body words")

          click_on "Create Comment"

          assert_selector "div", text: "comment body words"
        end
      end
    end
  end
end
