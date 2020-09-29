class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
  end
end
