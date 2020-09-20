require "test_helper"

module FactoryBots
  module Projects
    class ProjectIssueTest < ActiveSupport::TestCase
      test "has an invalid default factory" do
        project = build(:project_issue)

        assert_not project.valid?
      end

      test "has valid default factory with lead" do
        project = build(:project_issue,
          project: create(:project, lead: create(:account)),
          account: create(:account))

        assert project.valid?
      end
    end
  end
end
