class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_exercise, only: [:show, :edit, :update, :destroy]
    
    def index
        @exercises = Exercise.all.order("created_at DESC")
        
        @styles = current_user.training_types.all
    end
    
    def new
        @exercise = current_user.exercises.build
    end
    
    def create
        @exercise = current_user.exercises.build(exercise_params)
        
        respond_to do |format|
            if @exercise.save
                format.html { redirect_to exercises_path, :flash => { :success => 'Exercise was successfully created.' } }
                format.json { render :index, status: :created, location: @exercise }
            else
                format.html { render :new, :flash => { :danger => 'There was an error trying to create the exercise.' } }
                format.json { render json: @exercise.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def add_style
        
    end
    
    def show
        @last = WorkoutExercise.where(exercise_id: @exercise.id).last
    end
    
    def edit
    
    end

    def update
        respond_to do |format|
            if @exercise.update(exercise_params)
                format.html { redirect_to @exercise, :flash => { :success => 'Exercise updated successfully.' } }
                format.json { render :show, status: :updated, location: @exercise }
            else
                format.html { render :edit, :flash => { :danger => 'There was an error updating the exercise' } }
                format.json { render json: @exercise.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
    
    end
    
    private
    
        def exercise_params
           params.require(:exercise).permit(:name, :description, :image, :user_id) 
        end
        
        def find_exercise
            @exercise = Exercise.find(params[:id])
        end

end
