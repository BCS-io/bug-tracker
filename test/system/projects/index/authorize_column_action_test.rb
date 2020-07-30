require "application_system_test_case"

module Projects
  module Index
    class AuthorizeColumnActionTest < ApplicationSystemTestCase
      test "user can modify own records" do
        account = create(:account)
        create(:project, lead: account)
        sign_in account

        visit projects_url

        assert_no_text "Edit"
        assert_no_text "Delete"

        find("#project-action-0").click

        assert_text "Edit"
        assert_text "Destroy"
      end

      test "user does not modify another accounts records" do
        account = create(:account)
        other = create(:account)
        create(:project, lead: other)
        sign_in account

        visit projects_url

        assert_selector :css, "#project-action-cell-0"
        assert_no_selector :css, "#project-action-0"
      end

      test "admin can modify all records" do
        admin = create(:admin_account)
        other = create(:account)
        create(:project, lead: other)
        sign_in admin

        visit projects_url

        find("#project-action-0").click

        assert_text "Edit"
        assert_text "Destroy"
      end
    end
  end
end
