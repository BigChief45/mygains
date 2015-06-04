class RemoveWorkoutFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :workout
  end
end
