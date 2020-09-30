require "test_helper"

module Policies
  module Issues
    class UserPolicyTest < ActiveSupport::TestCase
      def setup
        @user = create(:account, role: Account.roles[:user])
        other = create(:account)
        @project = create(:project, lead: other)
        @issue = build(:project_issue, account: other, project: @project)
      end

      def test_index
        assert permit @user, @issue, :index?
      end

      def test_show
        assert permit @user, @issue, :show?
      end

      def test_create
        assert permit @user, @issue, :create?
      end

      def test_update
        assert forbid @user, @issue, :update?
      end
    end
  end
end
