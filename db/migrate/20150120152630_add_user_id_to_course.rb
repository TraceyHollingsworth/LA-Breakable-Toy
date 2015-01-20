class AddUserIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :user_id, :integer, null: false
  end
end
