class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.string :description
      t.belongs_to :lead, index: true

      t.timestamps
    end
  end
end
