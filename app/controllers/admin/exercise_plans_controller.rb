class Admin::ExercisePlansController < Admin::BaseController
  before_action :set_user_id, only: %i[index new]

  def new
    @exercise_plan = ExercisePlan.new
  end

  def create
    @exercise_plan = ExercisePlan.new(exercise_plan_params)
    if @exercise_plan.save
      user_id = @exercise_plan.user_id 
      redirect_to admin_exercise_plans_path(user_id: user_id)
    else
      render :new
    end
  end

  def index
    @exercise_plans = ExercisePlan.where(user_id: params[:user_id])
  end

  def edit
    @exercise_plan = ExercisePlan.find(params[:id])
  end

  def update
    @exercise_plan = ExercisePlan.find(params[:id])
    if @exercise_plan.update(exercise_plan_params)
      redirect_to admin_exercise_plans_path(user_id: @exercise_plan.user_id), notice: '実施訓練メニューを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @exercise_plan = ExercisePlan.find(params[:id])
    user_id = @exercise_plan.user_id
    @exercise_plan.destroy
    redirect_to admin_exercise_plans_path(user_id: user_id), notice: '実施訓練メニューを削除しました。'
  end

  private

  def set_user_id
    @user_id = params[:user_id]
  end

  def exercise_plan_params
    params.require(:exercise_plan).permit(:user_id, :training_menu, :description, :images_description, :movie_url, :images_cache, { images: [] })
  end
end
