require "test_helper"

module Issues
  class ValidationTest < ActiveSupport::TestCase
    def setup
      @account = build(:account)
      @project = build(:project, lead: @account)
    end

    [:summary, :status, :work].each do |attribute|
      test "validates #{attribute} present" do
        issue = build(:project_issue, attribute => nil, :project => @project)

        issue.valid?

        assert_includes(issue.errors.details[attribute], {error: :blank})
      end
    end
  end
end
