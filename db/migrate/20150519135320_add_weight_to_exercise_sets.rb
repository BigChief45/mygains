class AddWeightToExerciseSets < ActiveRecord::Migration
  def change
    add_column :exercise_sets, :weight, :float
  end
end
