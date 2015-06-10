class AddRemarksToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :remarks, :string
  end
end
