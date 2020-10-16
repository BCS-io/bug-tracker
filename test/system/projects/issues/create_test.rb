require "application_system_test_case"

module Projects
  module Issues
    class CreateTest < ApplicationSystemTestCase
      test "creating an Issue" do
        account = create(:account)
        project = create(:project, lead: account)
        sign_in account
        visit project_issues_url(project)
        click_on "Create issue"

        select "Improvement", from: "Work"
        fill_in "Summary", with: "My summary"
        select "Open", from: "Status"

        click_on "Create Issue"

        assert_text "Issue was successfully created"

        issue = project.issues.first
        assert_equal "improvement", issue.work
        assert_equal "My summary", issue.summary
        assert_equal "open", issue.status
      end

      test "creating an Issue with description" do
        account = create(:account)
        project = create(:project, lead: account)
        sign_in account
        visit project_issues_url(project)
        click_on "Create issue"

        select "Improvement", from: "Work"
        fill_in "Summary", with: "My summary"
        find("#editor").click.set("comment body")
        select "Open", from: "Status"

        click_on "Create Issue"

        assert_selector "h1", text: "Issues"
        assert_text "Issue was successfully created"
        click_link "My summary"

        assert_selector "span", text: "issue"
        assert_selector "h1", text: "My summary"
        assert_text "comment body"
      end

      test "display error messages" do
        account = create(:account)
        project = create(:project, lead: account)
        sign_in account
        visit new_project_issue_url(project)

        click_on "Create Issue"

        assert_text "Work can't be blank"
        assert_text "Summary can't be blank"
      end
    end
  end
end
