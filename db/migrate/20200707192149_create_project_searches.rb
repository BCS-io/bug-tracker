class CreateProjectSearches < ActiveRecord::Migration[6.0]
  def change
    create_view :project_searches
  end
end
