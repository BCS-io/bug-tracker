class AddRoleToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :role, :integer, default: 0
    add_index :accounts, :role
  end
end
