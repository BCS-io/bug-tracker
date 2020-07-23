require "test_helper"

module Policies
  module Projects
    class UserPolicyTest < ActiveSupport::TestCase
      def setup
        @account = create(:account, role: Account.roles["user"])
        other = create(:account)
        @project = Project.new(lead: other)
      end

      def test_index
        assert permit @account, @project, :index?
      end

      def test_create
        assert permit @account, @project, :create?
      end

      def test_update
        assert forbid @account, @project, :update?
      end

      def test_destroy
        assert forbid @account, @project, :destroy?
      end
    end
  end
end
