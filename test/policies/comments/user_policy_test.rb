require "test_helper"

module Policies
  module Comments
    class UserPolicyTest < ActiveSupport::TestCase
      def setup
        @user = create(:account, role: Account.roles[:user])
        other = create(:account)
        @comment = build(:comment, account: other)
      end

      def test_index
        assert permit @user, @comment, :index?
      end

      def test_show
        assert permit @user, @comment, :show?
      end

      def test_create
        assert permit @user, @comment, :create?
      end

      def test_update
        assert forbid @user, @comment, :update?
      end

      def test_delete
        assert forbid @user, @comment, :destroy?
      end
    end
  end
end
