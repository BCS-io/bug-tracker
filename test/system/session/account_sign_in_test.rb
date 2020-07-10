require "application_system_test_case"

module Session
  class AccountSignInTest < ApplicationSystemTestCase
    test "can sign in" do
      create(:account, email: "guest@example.com", password: "password")
      visit new_account_session_url

      assert_selector "h1", text: "Sign in"
      fill_in "Email", with: "guest@example.com"
      fill_in "Password", with: "password"

      click_on "Sign in"

      assert_selector "p", text: "Signed in successfully."
    end

    test "can display errors" do
      create(:account, email: "guest@example.com", password: "password")
      visit new_account_session_url

      click_on "Sign in"

      assert_selector "p", text: "Invalid Email or password."
    end
  end
end
