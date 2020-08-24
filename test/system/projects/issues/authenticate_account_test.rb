require "application_system_test_case"

module Projects
  class AuthenticateAccountTest < ApplicationSystemTestCase
    test "signed in use can visit project issues" do
      account = create(:account)
      project = create(:project, lead: account)
      sign_in account

      visit project_issues_url(project)

      assert_current_path project_issues_path(project)
    end
  end
end
