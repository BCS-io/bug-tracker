require "test_helper"

class Project::ValidationTest < ActiveSupport::TestCase
  def setup
    @account = build(:account)
  end

  test "validates project name minimum" do
    project = build(:project, name: "c" * 2)

    project.valid?

    assert_includes(
      project.errors.details[:name], {error: :too_short, count: 3}
    )
  end

  test "validates project key minimum" do
    project = build(:project, key: "c" * 1)

    project.valid?

    assert_includes(
      project.errors.details[:key], {error: :too_short, count: 2}
    )
  end

  [:name, :key].each do |attribute|
    test "validates project #{attribute} uniqueness" do
      create(:project, attribute => "common", :lead => @account)

      duplicate_project_name = build(:project, attribute => "common", :lead => @account)

      duplicate_project_name.valid?

      assert duplicate_project_name.errors.added?(attribute, :taken, value: "common")

      assert_includes(
        duplicate_project_name.errors.details[attribute], {error: :taken, value: "common"}
      )
    end
  end
end
