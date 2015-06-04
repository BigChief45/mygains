class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :workout_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
