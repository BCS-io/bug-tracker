require "test_helper"

class WorkBadgeComponentTest < ViewComponent::TestCase
  test "state bug" do
    render_inline(WorkBadgeComponent.new(work: "bug"))

    assert_text("Bug")
    assert_selector("div.bg-red-200")
    assert_selector("svg.text-gray-800")
  end

  test "state improvement" do
    render_inline(WorkBadgeComponent.new(work: "improvement"))

    assert_text("Improvement")
    assert_selector("div.bg-yellow-200")
    assert_selector("svg.text-gray-800")
  end

  test "state task" do
    render_inline(WorkBadgeComponent.new(work: "task"))

    assert_text("Task")
    assert_selector("div.bg-green-200")
    assert_selector("svg.text-gray-800")
  end

  test "state new feature" do
    render_inline(WorkBadgeComponent.new(work: "new_feature"))

    assert_text("New Feature")
    assert_selector("div.bg-white")
    assert_selector("svg.text-green-600")
  end

  test "state epic" do
    render_inline(WorkBadgeComponent.new(work: "epic"))

    assert_text("Epic")
    assert_selector("div.bg-purple-200")
    assert_selector("svg.text-gray-800")
  end

  test "state missing" do
    render_inline(WorkBadgeComponent.new(work: "missing state"))

    assert_text("Missing State")
    assert_selector("div.bg-orange-500")
    assert_selector("svg.text-pink-200")
  end
end
