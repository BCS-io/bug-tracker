class AddIndexToProjects < ActiveRecord::Migration[6.0]
  def change
    add_index :projects, :name, unique: true
    add_index :projects, :key, unique: true
  end
end
