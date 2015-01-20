class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "teacher"
  end
end
