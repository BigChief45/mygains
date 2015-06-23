class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.date :deadline
      t.string :title
      t.integer :exercise_id
      t.text :description
      t.integer :progress, :default => 0

      t.timestamps
    end
  end
end
