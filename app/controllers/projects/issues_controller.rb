module Projects
  class IssuesController < ApplicationController
    include Pagy::Backend
    before_action :authenticate_account!
    before_action :set_project, only: [:index, :new, :create]

    def index
      @query = params[:query]
      issues = @project.issues.includes([:account]).created_desc
      issues = issues.query(@query) if @query.present?
      @pagy, @issues = pagy(issues)
      authorize @issues
    end

    def new
      @issue = @project.issues.build
      authorize @issue
    end

    def create
      @issue = @project.issues.build(issue_params)
      @issue.account = current_account

      if @issue.save
        redirect_to project_issues_path(@issue.project), notice: "Issue was successfully created."
      else
        broadcast_errors @issue, issue_params
      end
      authorize @issue
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def issue_params
      params.require(:issue).permit(:work, :summary, :status)
    end
  end
end
