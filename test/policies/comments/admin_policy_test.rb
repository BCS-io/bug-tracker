require "test_helper"

module Policies
  module Comments
    class AdminPolicyTest < ActiveSupport::TestCase
      def setup
        @admin = Account.new(role: Account.roles["admin"])
        @comment = build(:comment)
      end

      def test_index
        assert permit @admin, @comment, :index?
      end

      def test_show
        assert permit @admin, @comment, :show?
      end

      def test_create
        assert permit @admin, @comment, :create?
      end

      def test_update
        assert permit @admin, @comment, :update?
      end

      def test_destroy
        assert permit @admin, @comment, :destroy?
      end
    end
  end
end
