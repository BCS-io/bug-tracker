require "test_helper"

module Projects
  module TableColumns
    class DBColumnTest < ActiveSupport::TestCase
      test "returns the correct sql column for name" do
        assert_equal "name", ProjectTableColumn.new("name").db_column
      end

      test "returns the correct sql column for key" do
        assert_equal "key", ProjectTableColumn.new("key").db_column
      end

      test "returns the correct sql column for lead" do
        assert_equal "username", ProjectTableColumn.new("lead").db_column
      end
    end
  end
end
