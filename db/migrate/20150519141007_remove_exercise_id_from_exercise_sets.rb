class RemoveExerciseIdFromExerciseSets < ActiveRecord::Migration
  def change
    remove_column :exercise_sets, :exercise_id
  end
end
