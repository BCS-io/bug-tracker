require "application_system_test_case"

module Projects
  module Index
    class DisplaysTest < ApplicationSystemTestCase
      test "displays projects index" do
        account = create(:account)
        project = create(:project, lead: account)
        sign_in account

        visit projects_url

        assert_selector :link, text: "Create", href: new_project_path
        assert_selector :link, text: project.name, href: project_issues_path(project)
        assert_selector :link, text: project.key, href: project_issues_path(project)
        assert_selector :link, text: project.lead.username, href: project_issues_path(project)
      end
    end
  end
end
