require "application_system_test_case"

module Accounts
  class GuestCreateTest < ApplicationSystemTestCase
    test "can sign up" do
      visit new_account_registration_url

      assert_selector "h1", text: "Create account"
      fill_in "Email", with: "guest@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create your Bug Tracker account"

      assert_selector "p", text: "You have signed up successfully."
    end

    test "can display errors" do
      visit new_account_registration_url

      click_on "Create your Bug Tracker account"

      assert_selector "h2", text: "errors prohibited this account from being saved"
    end
  end
end
