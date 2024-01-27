class ExerciseProgressesController < ApplicationController
def index
  @exercise_progresses = ExerciseProgress.where(user_id: current_user.id)
end

def new
    @exercise_plans = ExercisePlan.where(user_id: current_user.id)
    @exercise_progresses = ExerciseProgress.new
    @exercise_progresses.date = Date.today
end

def show
  @exercise_progresses = ExerciseProgress.find(params[:id])
  @exercise_plans = ExercisePlan.where(user_id: current_user.id)
  @exercise_progress_comments = @exercise_progresses.exercise_progress_comments
end

def create
    @exercise_progresses = ExerciseProgress.new(exercise_progress_params)
    @exercise_progresses.user_id = current_user.id
    if @exercise_progresses.save
      redirect_to exercise_progresses_path
    else
      render :new
    end
  end
  
  private
  
  def exercise_progress_params
    params.require(:exercise_progress).permit(:date, :today_at, :progresse_keep, :user_id)
  end

end
