class ProjectsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_account!

  def index
    @direction = permitted_direction(session[:direction])
    @order_by = ProjectTableColumn.new(session[:order_by]).safe_table_column
    projects = Project.includes(:lead)
      .joins(:lead)
      .select("projects.id, projects.name, projects.key, accounts.username as username")
      .order(ProjectTableColumn.new(@order_by).sql_column => @direction)

    @page = (session[:page] || 1).to_i
    @pagy, @projects = pagy(projects, page: @page)
    authorize @projects
  end

  private

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end
end
