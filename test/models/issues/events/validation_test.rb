require "test_helper"

module Issues
  module Events
    class ValidationTest < ActiveSupport::TestCase
      def setup
        @project = create(:project, lead: create(:account))
        @issue = create(:project_issue, project: @project, account: create(:account))
      end

      [:action].each do |attribute|
        test "validates #{attribute} present" do
          event = build(:issues_event, attribute => nil)

          event.valid?

          assert_includes(event.errors.details[attribute], {error: :blank})
        end
      end
    end
  end
end
