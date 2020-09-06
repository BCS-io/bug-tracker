require "application_system_test_case"

module Projects
  module Index
    class SearchTest < ApplicationSystemTestCase
      test "searches projects by name" do
        account = create(:account)
        sign_in account

        create(:project, name: "Aardvark", lead: account)
        create(:project, name: "Zebra", lead: account)
        visit projects_url

        page.assert_text(/Aardvark.*Zebra/m)

        fill_in "search", with: "Aardvark"

        page.assert_text(/Aardvark/m)
        page.assert_no_text(/Zebra/)
      end
    end
  end
end
