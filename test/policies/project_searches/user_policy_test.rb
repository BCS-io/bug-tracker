require "test_helper"

module Policies
  module ProjectSearches
    class UserPolicyTest < ActiveSupport::TestCase
      def setup
        @user = create(:account)
        other = create(:account)
        project = Project.new(lead: other)
        @project_search = ProjectSearch
          .new(id: project.id,
               name: project.name,
               key: project.key,
               lead_id: other.id,
               username: other.username)
      end

      def test_index
        assert permit @user, @project_search, :index?
      end

      def test_create
        assert permit @user, @project_search, :create?
      end

      def test_update
        assert forbid @user, @project_search, :update?
      end

      def test_destroy
        assert forbid @user, @project_search, :destroy?
      end
    end
  end
end
