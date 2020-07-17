class ProjectsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_account!

  def index
    query = session[:query]
    @direction = permitted_direction(session[:direction])
    @order_by = ProjectTableColumn.new(session[:order_by]).safe_table_column
    projects = Project.includes(:lead)
      .joins(:lead)
      .select("projects.id, projects.name, projects.key, accounts.username as username")
      .order(ProjectTableColumn.new(@order_by).sql_column => @direction)

    projects = projects.search(query) if query.present?
    @page = (session[:page] || 1).to_i
    @pagy, @projects = pagy(projects, page: @page)
    authorize @projects
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.lead = current_account

    if @project.save
      redirect_to projects_path, notice: "Project was successfully created."
    else
      broadcast_errors @project, project_params
    end
    authorize @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :key, :description)
  end

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end
end
