module Projects
  class IssuesController < ApplicationController
    include Pagy::Backend
    before_action :set_project, only: [:index]

    def index
      issues = @project.issues.includes([:account]).created_desc
      @pagy, @issues = pagy(issues)
      authorize @issues
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end
  end
end
