class ExerciseSet < ActiveRecord::Base
    
    belongs_to :workout_exercises
    
    validates :reps, :presence => true
    validates :weight, :presence => true
    
end
