require "application_system_test_case"

module Projects
  class CreateTest < ApplicationSystemTestCase
    test "creating a Project" do
      account = create(:account)
      sign_in account
      visit projects_url

      click_on "Create"

      fill_in "Name", with: "New project"
      fill_in "Key", with: "NP"
      fill_in "Description", with: "My description"
      click_on "Create Project"

      assert_text "Project was successfully created"
    end

    test "display error messages" do
      account = create(:account)
      sign_in account
      visit projects_url

      click_on "Create"

      click_on "Create Project"

      assert_text "Name is too short (minimum is"
      assert_text "Key is too short (minimum is"
    end
  end
end
