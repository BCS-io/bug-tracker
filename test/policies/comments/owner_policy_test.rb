require "test_helper"

module Policies
  module Comments
    class OwnerPolicyTest < ActiveSupport::TestCase
      def setup
        @owner = create(:account, role: Account.roles[:user])
        @comment = create(:comment, commentable: commentable, account: @owner)
      end

      def test_index
        assert permit @owner, @comment, :index?
      end

      def test_show
        assert permit @owner, @comment, :show?
      end

      def test_create
        assert permit @owner, @comment, :create?
      end

      def test_update
        assert permit @owner, @comment, :update?
      end

      def test_delete
        assert permit @owner, @comment, :destroy?
      end

      private

      def commentable
        create(:project_issue, project: create(:project, lead: create(:account)),
                               account: create(:account))
      end
    end
  end
end
