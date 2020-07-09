require "application_system_test_case"

module Projects
  class AuthenticateAccountTest < ApplicationSystemTestCase
    test "signed in use can visit projects" do
      sign_in create(:account)

      visit projects_url

      assert_current_path projects_path
    end
  end
end
