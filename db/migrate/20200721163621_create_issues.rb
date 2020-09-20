class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :project, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.integer :work, null: false, index: true
      t.string :summary, null: false
      t.integer :status, null: false, default: 0, index: true

      t.timestamps
    end
  end
end
