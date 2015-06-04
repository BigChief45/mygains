class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_exercise, only: [:show, :edit, :update, :destroy]
    
    def index
        @exercises = Exercise.all.order("created_at DESC")
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
    
    def show
    
    end
    
    def edit
    
    end

    def update
    
    end
    
    def destroy
    
    end
    
    private
    
        def exercise_params
           params.require(:exercise).permit(:name, :description, :user_id) 
        end
        
        def find_exercise
            @exercise = Exercise.find(params[:id])
        end

end
