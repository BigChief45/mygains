class TrainingType < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :workout_exercise
end
