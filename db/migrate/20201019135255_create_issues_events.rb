class CreateIssuesEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :issues_events do |t|
      t.references :issue, null: false, foreign_key: true
      t.string :action, null: false
      t.references :eventable, polymorphic: true

      t.timestamps
    end

     add_index :issues_events, [:eventable_id, :eventable_type]
  end
end
