require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  test "visiting the index" do
    sign_in create(:account)
    visit projects_url

    assert_selector "h1", text: "Projects"
  end
end
