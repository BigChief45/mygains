class Workout < ActiveRecord::Base
    
    validates :date, :presence => true
    validates :date, :uniqueness => true
    
    belongs_to :user
    
    has_many :workout_exercises, dependent: :destroy
    accepts_nested_attributes_for :workout_exercises, :reject_if => :all_blank, :allow_destroy => true
    
    after_save :update_goal
    after_update :update_goal
    after_destroy :update_goal
    
    def next
        self.class.where("id > ?", id).first
    end

    def previous
        self.class.where("id < ?", id).last
    end
   
   
   protected
   
        def update_goal
            
        end
    
end
