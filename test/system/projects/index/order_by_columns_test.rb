require "application_system_test_case"

module Projects
  module Index
    class OrderByColumnsTest < ApplicationSystemTestCase
      test "orders projects by names" do
        cat = create(:account, name: "Cat")
        wombat = create(:account, name: "Wombat")
        sign_in cat

        create(:project, name: "Aardvark", key: "Bear", lead: cat)
        create(:project, name: "Zebra", key: "Yak", lead: wombat)
        visit projects_url

        page.assert_text(/Aardvark.*Zebra/m)

        click_on "Name ↑"

        page.assert_text(/Zebra.*Aardvark/m)

        click_on "Key"

        page.assert_text(/Bear.*Yak/m)

        click_on "Key ↑"

        page.assert_text(/Yak.*Bear/m)

        click_on "Lead"

        page.assert_text(/Cat.*Wombat/m)

        click_on "Lead ↑"

        page.assert_text(/Wombat.*Cat/m)
      end
    end
  end
end
