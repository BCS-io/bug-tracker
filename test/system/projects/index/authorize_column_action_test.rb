require "application_system_test_case"

module Projects
  module Index
    class AuthorizeColumnActionTest < ApplicationSystemTestCase
      test "user can modify own records" do
        account = create(:account)
        create(:project, lead: account)
        sign_in account

        visit projects_url

        assert_selector :css, "#edit-project-0 > a"
        assert_selector :css, "#destroy-project-0 > a"
      end

      test "user does not modify another accounts records" do
        account = create(:account)
        other = create(:account)
        create(:project, lead: other)
        sign_in account

        visit projects_url

        assert_no_selector :css, "#edit-project-0 > a"
        assert_no_selector :css, "#destroy-project-0 > a"
      end

      test "admin can modify all records" do
        admin = create(:admin_account)
        other = create(:account)
        create(:project, lead: other)
        sign_in admin

        visit projects_url

        assert_selector :css, "#edit-project-0 > a"
        assert_selector :css, "#destroy-project-0 > a"
      end
    end
  end
end
