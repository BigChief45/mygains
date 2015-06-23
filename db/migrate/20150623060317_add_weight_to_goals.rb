class AddWeightToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :weight, :double
  end
end
