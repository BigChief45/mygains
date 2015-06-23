class AddRepsToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :reps, :integer
  end
end
