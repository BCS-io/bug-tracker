require "test_helper"

class ProjectTableColumn::SQLColumnTest < ActiveSupport::TestCase
  test "returns the correct sql column for name" do
    assert_equal "name", ProjectTableColumn.new("name").sql_column
  end

  test "returns the correct sql column for key" do
    assert_equal "key", ProjectTableColumn.new("key").sql_column
  end

  test "returns the correct sql column for lead" do
    assert_equal "accounts.username", ProjectTableColumn.new("lead").sql_column
  end
end
