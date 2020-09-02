require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "page_session_name returns expected name" do
    assert_equal "my_test_page", page_session_name("my_test")
  end
end
