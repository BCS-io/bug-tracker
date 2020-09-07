require "test_helper"

module Projects
  module ProjectSearches
    class AdminPolicyTest < ActiveSupport::TestCase
      def setup
        @admin = create(:admin_account)
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
        assert permit @admin, @project_search, :index?
      end

      def test_create
        assert permit @admin, @project_search, :create?
      end

      def test_update
        assert permit @admin, @project_search, :update?
      end

      def test_destroy
        assert permit @admin, @project_search, :destroy?
      end
    end
  end
end
