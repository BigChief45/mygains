class WorkoutsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_workout, only: [:show, :edit, :update, :destroy]
    
    def index
        @workouts = current_user.workouts.order("created_at DESC")
        
        #Pagination
        @workouts = @workouts.paginate(:page => params[:page], :per_page => 3)
    end
    
    def new
        @workout = current_user.workouts.build
    end
    
    def create
        @workout = current_user.workouts.build(workout_params)
        
        respond_to do |format|
            if @workout.save
                format.html { redirect_to @workout, :flash => { :success => 'Workout was successfully logged.' } }
                format.json { render :show, status: :created, location: @workout }
            else
                format.html { render :new, :flash => { :danger => 'There was an error trying to log your workout.' } }
                format.json { render json: @workout.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        respond_to do |format|
            if @workout.update(workout_params)
                format.html { redirect_to @workout, :flash => { :success => 'Workout updated successfully.' } }
                format.json { render :show, status: :updated, location: @workout }
            else
                format.html { render :edit, :flash => { :danger => 'There was an error updating the workout' } }
                format.json { render json: @workout.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @workout.destroy
        respond_to do |format|
          format.html { redirect_to workouts_path, :flash => { :success => 'Workout was successfully removed.' } }
        end
    end
    
    
    private
    
        def workout_params
            params.require(:workout).permit(:date, :remarks, workout_exercises_attributes: [:id, :exercise_id, :_destroy, exercise_sets_attributes: [:id, :reps, :workout_exercise_id, :weight, :_destroy]])  
        end
        
        def find_workout
            @workout = Workout.find(params[:id])
        end
end
