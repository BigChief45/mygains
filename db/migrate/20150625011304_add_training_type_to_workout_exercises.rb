class AddTrainingTypeToWorkoutExercises < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :training_type, :integer
  end
end
