require "test_helper"

module Policies
  module Projects
    class OwnerPolicyTest < ActiveSupport::TestCase
      def setup
        @account = create(:account)
        @project = Project.new(lead: @account)
      end

      def test_index
        assert permit @account, @project, :index?
      end

      def test_create
        assert permit @account, @project, :create?
      end

      def test_update
        assert permit @account, @project, :update?
      end

      def test_destroy
        assert permit @account, @project, :destroy?
      end
    end
  end
end
