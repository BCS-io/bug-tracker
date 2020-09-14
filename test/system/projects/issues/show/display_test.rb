require "application_system_test_case"

module Projects
  module Issues
    module Show
      class DisplayTest < ApplicationSystemTestCase
        test "shows an issue" do
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
          assert_text "show issue"
        end
      end
    end
  end
end
