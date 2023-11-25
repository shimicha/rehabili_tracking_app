class Admin::ExercisePlansController < Admin::BaseController
  def new
    @exercise_plan = ExercisePlan.new
  end

  def create
    @exercise_plan = ExercisePlan.new(exercise_plan_params)
    if @exercise_plan.save
      redirect_to admin_exercise_plans_path
    else
      render :new
    end
  end

  def index
    @exercise_plans = ExercisePlan.all
  end

  def edit
    @exercise_plan = ExercisePlan.find(params[:id])
  end

  def update
    @exercise_plan = ExercisePlan.find(params[:id])
    if @exercise_plan.update(exercise_plan_params)
      redirect_to admin_exercise_plans_path, notice: '実施訓練メニューを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @exercise_plan = ExercisePlan.find(params[:id])
    @exercise_plan.destroy
    redirect_to admin_exercise_plans_path, notice: '実施訓練メニューを削除しました。'
  end

  private

  def exercise_plan_params
    params.require(:exercise_plan).permit(:training_menu, :description, :image, :image_description, :movie_url, :image_cache)
  end
end
