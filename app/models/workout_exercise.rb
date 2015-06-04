class WorkoutExercise < ActiveRecord::Base
    
    validates :exercise_id, :presence => true
    
    belongs_to :workout
    
    has_one :exercise
    has_many :exercise_sets, dependent: :destroy
    
    accepts_nested_attributes_for :exercise_sets, :reject_if => :all_blank, :allow_destroy => true
    
end
