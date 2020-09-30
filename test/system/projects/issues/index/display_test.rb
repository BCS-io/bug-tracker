require "application_system_test_case"

module Projects
  module Issues
    module Index
      class DisplayTest < ApplicationSystemTestCase
        test "shows projects issues index" do
          account = create(:account)
          project = create(:project, lead: account)
          issue = create(:project_issue,
            summary: "eagle owl",
            project: project,
            account: account)
          sign_in account

          visit projects_url

          click_on project.name

          assert_current_path project_issues_path(project)
          assert_selector :link, text: "Projects", href: account_root_path
          assert_selector "span", text: project.name.to_s
          assert_selector "h1", text: "Issues"
          assert_selector :link, text: "Create issue", href: new_project_issue_path(project)
          assert_selector "span", text: issue.summary
        end
      end
    end
  end
end
