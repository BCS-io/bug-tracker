require "test_helper"

class Project::SearchTest < ActiveSupport::TestCase
  test "searches by name" do
    account = create(:account)
    item = create(:project, name: "Aardvark", lead: account)
    create(:project, name: "Zebra", lead: account)

    results = Project.search("Aardvark")
    assert_equal 1, results.count
    assert_equal item, results[0]
  end

  test "searches by key" do
    account = create(:account)
    item = create(:project, key: "Bear", lead: account)
    create(:project, key: "Yak", lead: account)

    results = Project.search("Bear")
    assert_equal 1, results.count
    assert_equal item, results[0]
  end
end
