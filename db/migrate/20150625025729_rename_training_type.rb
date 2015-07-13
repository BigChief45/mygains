class RenameTrainingType < ActiveRecord::Migration
  def change
    rename_column :workout_exercises, :training_type, :training_type_id
  end
end
