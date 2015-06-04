class AddRepsToExerciseSets < ActiveRecord::Migration
  def change
    add_column :exercise_sets, :reps, :integer
  end
end
