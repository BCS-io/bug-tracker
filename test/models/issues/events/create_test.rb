require "test_helper"

module Issues
  module Events
    class CreateTest < ActiveSupport::TestCase
      def setup
        @project = create(:project, lead: create(:account))
        @issue = create(:project_issue, project: @project, account: create(:account))
      end

      test "can create Issues::Event" do
        comment = create(:comment, commentable: @issue, account: create(:account), words: "first")
        @issue.events.create(eventable: comment, action: "commented")
        event = @issue.events.first

        assert_equal @issue, event.issue
        assert_equal comment, event.eventable
        assert_equal "commented", event.action
      end
    end
  end
end
