require "application_system_test_case"

module Projects
  class DestroyTest < ApplicationSystemTestCase
    test "deletes a project" do
      account = create(:account)
      create(:project, lead: account)
      sign_in account
      visit projects_url

      find("#project-action-0").click

      page.accept_confirm do
        click_on("Destroy")
      end

      assert_text "Project was successfully destroyed"
    end
  end
end
