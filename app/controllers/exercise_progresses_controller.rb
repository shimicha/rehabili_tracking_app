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
    @exercise_progresse.user_id = current_user.id
    if @exercise_progresse.save
      redirect_to exercise_progresses_path, notice: 'Exercise Progresse was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def exercise_progresse_params
    params.require(:exercise_progresse).permit(:date, :today_at, :progresse_keep, :user_id)
  end

end
