require "test_helper"

Pagination = Struct.new(:series, :prev, :next)

class PaginateComponentTest < ViewComponent::TestCase
  test "Shows only next link on first page of three" do
    double = Pagination.new(["1", 2, 3], nil, 2)

    render_inline(PaginateComponent.new(pagy: double, root: nil))

    assert_no_selector(:css, "#previous", visible: :hidden)
    assert_selector(:css, ".border-gray-300", text: "1")
    assert_no_selector(:css, ".border-gray-300", text: "2")
    assert_no_selector(:css, ".border-gray-300", text: "3")
    assert_selector(:css, "#next")
  end

  test "shows next and previous links on middle page of three" do
    double = Pagination.new([1, "2", 3], 1, 3)

    render_inline(PaginateComponent.new(pagy: double, root: nil))

    assert_selector(:css, "#previous")
    assert_no_selector(:css, ".border-gray-300", text: "1")
    assert_selector(:css, ".border-gray-300", text: "2")
    assert_no_selector(:css, ".border-gray-300", text: "3")
    assert_selector(:css, "#next")
  end

  test "shows only previous on last page of three" do
    double = Pagination.new([1, 2, "3"], 2, nil)

    render_inline(PaginateComponent.new(pagy: double, root: nil))

    assert_selector(:css, "#previous")
    assert_no_selector(:css, ".border-gray-300", text: "1")
    assert_no_selector(:css, ".border-gray-300", text: "2")
    assert_selector(:css, ".border-gray-300", text: "3")
    assert_no_selector(:css, "#next", visible: :hidden)
  end
end
