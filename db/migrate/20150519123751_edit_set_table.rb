class EditSetTable < ActiveRecord::Migration
  def change
    remove_column :exercise_sets, :workout_id
    add_column :exercise_sets, :workout_exercise_id, :integer
  end
end
