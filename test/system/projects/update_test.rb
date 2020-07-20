require "application_system_test_case"

module Projects
  class UpdateTest < ApplicationSystemTestCase
    test "updating a Project" do
      account = create(:account)
      project = create(:project, lead: account)
      sign_in account
      visit projects_url

      find("#edit-project-0").click

      fill_in "Name", with: "Edit project"
      fill_in "Key", with: "NK"
      fill_in "Description", with: "My new description"
      click_on "Update Project"

      project.reload
      assert_text "Project was successfully updated"
      assert_equal "Edit project", project.name
      assert_equal "NK", project.key
      assert_equal "My new description", project.description
    end

    test "display error messages" do
      account = create(:account)
      create(:project, lead: account)
      sign_in account
      visit projects_url

      find("#edit-project-0").click
      fill_in "Name", with: ""
      fill_in "Key", with: ""

      click_on "Update Project"

      assert_text "Name is too short (minimum is"
      assert_text "Key is too short (minimum is"
    end
  end
end
