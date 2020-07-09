class ProjectsController < ApplicationController
  before_action :authenticate_account!

  def index
    @projects = Project.includes(:lead)
      .joins(:lead)
      .select("projects.id, projects.name, projects.key, accounts.username as username")
    authorize @projects
  end
end
