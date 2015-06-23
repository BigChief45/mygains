class Exercise < ActiveRecord::Base
    
    validates :name, :presence => true
    
    belongs_to :user
    belongs_to :goal
    belongs_to :workout_exercise
end
