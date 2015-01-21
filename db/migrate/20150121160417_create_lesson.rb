class CreateLesson < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_id, null: false
      t.datetime :date, null: false
      t.text :objective, null: false
      t.text :prework
      t.text :lecture
      t.text :postwork
      t.text :extra_help
      t.text :add_ons

      t.timestamps null: false
    end
  end
end
