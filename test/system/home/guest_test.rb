require "application_system_test_case"

module Home
  class GuestTest < ApplicationSystemTestCase
    test "visits the index" do
      visit root_url

      assert_selector :link, text: "Bug Tracker", href: root_path
      assert_selector :link, text: "Sign in", href: new_account_session_path
      assert_selector :link, text: "Create account", href: new_account_registration_path
    end
  end
end
