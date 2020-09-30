require "test_helper"

module Policies
  module Issues
    class OwnerIssuePolicyTest < ActiveSupport::TestCase
      def setup
        @owner = create(:account, role: Account.roles[:user])
        project = create(:project, lead: create(:account))
        @issue = build(:project_issue, project: project, account: @owner)
      end

      def test_index
        assert permit @owner, @issue, :index?
      end

      def test_show
        assert permit @owner, @issue, :show?
      end

      def test_create
        assert permit @owner, @issue, :create?
      end

      def test_update
        assert permit @owner, @issue, :update?
      end
    end
  end
end
