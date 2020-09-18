require "application_system_test_case"

module Projects
  module Issues
    module Show
      class InlineEditTest < ApplicationSystemTestCase
        test "editing a summary" do
          account = create(:account)
          project = create(:project, lead: account)
          issue = create(:project_issue,
            project: project,
            account: account,
            summary: "a new issue")

          sign_in account
          visit project_issue_url(project, issue)

          click_on "Edit"

          fill_in "summary", with: "Chameleon"
          click_on "Save"
          assert_text "Chameleon"
        end

        test "displays error" do
          account = create(:account)
          project = create(:project, lead: account)
          issue = create(:project_issue,
            project: project,
            account: account,
            summary: "a new issue")

          sign_in account
          visit project_issue_url(project, issue)

          click_on "Edit"

          fill_in "summary", with: ""
          click_on "Save"
          assert_text "Summary can't be blank"
        end
      end
    end
  end
end
