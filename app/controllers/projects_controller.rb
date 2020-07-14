class ProjectsController < ApplicationController
  before_action :authenticate_account!

  def index
    @direction = permitted_direction(session[:direction])
    @order_by = ProjectTableColumn.new(session[:order_by]).safe_table_column
    @projects = Project.includes(:lead)
      .joins(:lead)
      .select("projects.id, projects.name, projects.key, accounts.username as username")
      .order(ProjectTableColumn.new(@order_by).db_column => @direction)
    authorize @projects
  end

  private

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end
end
