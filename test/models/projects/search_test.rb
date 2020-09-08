require "test_helper"

module Projects
  class SearchTest < ActiveSupport::TestCase
    test "searches by name" do
      account = create(:account)
      item = create(:project, name: "Aardvark", lead: account)
      create(:project, name: "Zebra", lead: account)

      results = ProjectSearch.query("Aardvark")
      assert_equal 1, results.count
      assert_equal item.name, results[0].name
    end

    test "searches by key" do
      account = create(:account)
      item = create(:project, key: "Bear", lead: account)
      create(:project, key: "Yak", lead: account)

      results = ProjectSearch.query("Bear")
      assert_equal 1, results.count
      assert_equal item.key, results[0].key
    end

    test "searches by lead username" do
      account = create(:account, username: "Cougar")
      other = create(:account, username: "Walrus")
      item = create(:project, lead: account)
      create(:project, lead: other)

      results = ProjectSearch.query("Cougar")
      assert_equal 1, results.count
      assert_equal item.lead.username, results[0].username
    end
  end
end
