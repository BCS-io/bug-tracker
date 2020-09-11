require "test_helper"

module FactoryBots
  class ProjectTest < ActiveSupport::TestCase
    test "has an invalid default factory" do
      project = build(:project)

      assert_not project.valid?
    end

    test "has valid default factory with lead" do
      project = build(:project, lead: create(:account))

      assert project.valid?
    end
  end
end
