class Exercise < ActiveRecord::Base
    
    validates :name, :presence => true
    
    has_attached_file :image, :styles => { :medium => "171x180>" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    belongs_to :user
    belongs_to :goal
    belongs_to :workout_exercise
    
end
