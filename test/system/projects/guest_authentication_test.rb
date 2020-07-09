require "application_system_test_case"

module Projects
  class GuestAuthenticationTest < ApplicationSystemTestCase
    test "cannot visit project" do
      visit projects_url

      assert_current_path new_account_session_path
    end
  end
end
