require "application_system_test_case"

module Accounts
  class AccountEditTest < ApplicationSystemTestCase
    def setup
      @account = create(:account, username: "guest", email: "guest@example.com", password: "password")
      sign_in @account
    end

    test "can update" do
      visit edit_account_registration_url

      assert_selector "h1", text: "Edit Account"
      assert_selector :link, text: "Sign out", href: destroy_account_session_path
      fill_in "Username", with: "account"
      fill_in "Email", with: "account@example.com"
      fill_in "Current password", with: "password"

      click_on "Update account"

      @account.reload
      assert_selector "p", text: "Your account has been updated successfully."
      assert_equal "account", @account.username
      assert_equal "account@example.com", @account.email
    end

    test "can display errors" do
      visit edit_account_registration_url

      click_on "Update account"

      assert_selector "h2", text: "prohibited this account from being saved"
    end
  end
end
