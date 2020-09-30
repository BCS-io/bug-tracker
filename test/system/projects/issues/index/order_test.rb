require "application_system_test_case"

module Projects
  module Issues
    module Index
      class OrderTest < ApplicationSystemTestCase
        test "shows projects issues index" do
          account = create(:account)
          project = create(:project, lead: account)
          create(:project_issue,
            summary: "muskrat",
            project: project,
            account: account,
            created_at: 3.days.ago)
          create(:project_issue,
            summary: "budgerigar",
            project: project,
            account: account,
            created_at: 2.days.ago)
          sign_in account

          visit project_issues_url(project)

          page.assert_text(/budgerigar.*muskrat/m)
        end
      end
    end
  end
end
