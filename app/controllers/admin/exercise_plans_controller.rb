class Admin::ExercisePlansController < Admin::BaseController
  def new
    @exercise_plan = ExercisePlan.new
  end

  def create
    @exercise_plan = ExercisePlan.new(exercise_plan_params)
    if @exercise_plan.save
      redirect_to '#'
    else
      render :new
    end
  end

  def index
    @exercise_plan = current_user.exercise_plan
  end

  private

  def exercise_plan_params
    params.require(:exercise_plan).permit(:training_menu, :description)
  end
end
