require "test_helper"

module Policies
  module ProjectSearches
    class OwnerPolicyTest < ActiveSupport::TestCase
      def setup
        @owner = create(:account)
        project = Project.new(lead: @owner)
        @project_search = ProjectSearch
          .new(id: project.id,
               name: project.name,
               key: project.key,
               lead_id: @owner.id,
               username: @owner.username)
      end

      def test_index
        assert permit @owner, @project_search, :index?
      end

      def test_create
        assert permit @owner, @project_search, :create?
      end

      def test_update
        assert permit @owner, @project_search, :update?
      end

      def test_destroy
        assert permit @owner, @project_search, :destroy?
      end
    end
  end
end
