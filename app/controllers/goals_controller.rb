class GoalsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_goal, only: [:show, :edit, :update, :destroy]
    
    def index
        @goals = current_user.goals.order("created_at DESC")
    end
    
    def new
       @goal = current_user.goals.build 
    end
    
    def create
        @goal = current_user.goals.build(goals_params)
        
        respond_to do |format|
            if @goal.save
                format.html { redirect_to @goal, :flash => { :success => 'Goal was successfully created.' } }
                format.json { render :show, status: :created, location: @goal }
            else
                format.html { render :new, :flash => { :danger => 'There was an error trying to create your goal.' } }
                format.json { render json: @goal.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
        
    end
    
    def destroy
        @goal.destroy
        respond_to do |format|
          format.html { redirect_to goals_path, :flash => { :success => 'Goal was successfully removed.' } }
        end 
    end
    
    def edit
        
    end
    
    def update
       respond_to do |format|
            if @goal.update(workout_params)
                format.html { redirect_to @goal, :flash => { :success => 'Goal updated successfully.' } }
                format.json { render :show, status: :updated, location: @goal }
            else
                format.html { render :edit, :flash => { :danger => 'There was an error updating the goal' } }
                format.json { render json: @goal.errors, status: :unprocessable_entity }
            end
        end 
    end
    
    private
    
        def find_goal
           @goal = Goal.find(params[:id]) 
        end
        
        def goals_params
            params.require(:goal).permit(:title, :deadline, :exercise_id, :weight, :reps, :description, :user_id)
        end
end
