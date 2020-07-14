require "test_helper"

module Projects
  module TableColumns
    class SafeColumnTest < ActiveSupport::TestCase
      test "returns an allowed column unchanged" do
        assert_equal "name", ProjectTableColumn.new("name").safe_table_column
      end

      test "returns the key and not the value" do
        assert_equal "lead", ProjectTableColumn.new("lead").safe_table_column
      end

      test "returns default if column forbidden" do
        assert_equal "name", ProjectTableColumn.new("Unknown").safe_table_column
      end
    end
  end
end
