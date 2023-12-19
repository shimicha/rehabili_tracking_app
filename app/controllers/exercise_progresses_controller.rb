class ExerciseProgressesController < ApplicationController
def index
    @exercise_progresses = ExerciseProgresse.all
end

def new
    @exercise_plans = ExercisePlan.all
    @exercise_progresse = ExerciseProgresse.new
    @exercise_progresse.date = Date.today
end

def create
    @exercise_progresse = ExerciseProgresse.new(exercise_progresse_params)
    
    @exercise_progresse.tag = params[:exercise_progresse][:tag]
  
    if @exercise_progresse.save
      redirect_to @exercise_progresse, notice: 'Exercise Progresse was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def exercise_progresse_params
    params.require(:exercise_progresse).permit(:date, tag: [], exercise_plans_attributes: [:training_menu, :progresse_keep])
  end

end
