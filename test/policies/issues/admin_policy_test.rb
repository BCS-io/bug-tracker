require "test_helper"

module Policies
  module Issues
    class AdminPolicyTest < ActiveSupport::TestCase
      def setup
        @admin = Account.new(role: Account.roles["admin"])
        other = create(:account)
        project = create(:project, lead: other)
        @issue = build(:project_issue, project: project, account: other)
      end

      def test_index
        assert permit @admin, @issue, :index?
      end

      def test_show
        assert permit @admin, @issue, :show?
      end

      def test_create
        assert permit @admin, @issue, :create?
      end

      def test_update
        assert permit @admin, @issue, :update?
      end
    end
  end
end
