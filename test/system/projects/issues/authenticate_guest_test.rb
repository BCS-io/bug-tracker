require "application_system_test_case"

module Projects
  module Issues
    class AuthenticateGuestTest < ApplicationSystemTestCase
      test "cannot visit project issues" do
        account = create(:account)
        project = create(:project, lead: account)

        visit project_issues_url(project_id: project)

        assert_current_path new_account_session_path
      end
    end
  end
end
