class TrainingTypesController < ApplicationController
    
    def create
        @style = current_user.training_types.build(style_params)
        
        respond_to do |format|
            if @style.save
                format.html { redirect_to exercises_path, :flash => { :success => 'Training style created successfully' } }
                format.json { render :show, status: :created, location: @style }
            else
                format.html { redirect_to exercises_path, :flash => { :danger => 'There was an error trying to create the training style.' } }
                format.json { render json: @style.errors, status: :unprocessable_entity }
            end
        end
    
    end
    
    private
    
        def style_params
           params.require(:training_type).permit(:name, :user_id) 
        end
end
