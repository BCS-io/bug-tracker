module Projects
  class IssuesController < ApplicationController
    include Pagy::Backend
    before_action :authenticate_account!
    before_action :set_project, only: [:index, :new, :create]
    before_action :set_issue, only: [:show, :edit, :update]

    def index
      @query = params[:query]
      issues = @project.issues.includes([:account]).created_desc
      issues = issues.query(@query) if @query.present?
      @pagy, @issues = pagy(issues)
      authorize @issues
    end

    def show
      @comments = @issue.comments.includes([:rich_text_words])
      authorize @issue
    end

    def new
      @issue = @project.issues.build
      @issue.comments.build
      authorize @issue
    end

    def edit
    end

    def create
      @issue = @project.issues.build(issue_params)
      @issue.account = current_account
      @issue.comments.first.account = current_account

      if @issue.save
        redirect_to project_issues_path(@issue.project), notice: "Issue was successfully created."
      else
        broadcast_errors @issue, issue_params
      end
      authorize @issue
    end

    def update
      respond_to do |format|
        if @issue.update(issue_params)
          redirect_to([@issue.project, @issue], notice: "Issue was successfully updated.")
          format.js
        else
          format.html { broadcast_errors @issue, issue_params }
        end
      end
      authorize @issue
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:work, :summary, :status, comments_attributes: [:id, :words])
    end
  end
end
