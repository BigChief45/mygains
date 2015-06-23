class Goal < ActiveRecord::Base
    
    validates :title, :presence => true
    validates :deadline, :presence => true
    validates :exercise_id, :presence => true
    
    belongs_to :user
    
    has_one :exercise
    
end
