class Workout < ActiveRecord::Base
    
    validates :date, :presence => true
    validates :date, :uniqueness => true
    
    belongs_to :user
    
    has_many :workout_exercises, dependent: :destroy
    accepts_nested_attributes_for :workout_exercises, :reject_if => :all_blank, :allow_destroy => true
end
