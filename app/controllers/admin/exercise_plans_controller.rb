class Admin::ExercisePlansController < Admin::BaseController
  before_action :set_user_id, only: %i[index new]

  def new
    @exercise_plan = ExercisePlan.new
  end

  def create
    @exercise_plan = ExercisePlan.new(exercise_plan_params)
    if @exercise_plan.save
      send_notification(@exercise_plan.user_id, 'エクササイズプランが作成されました。')
      redirect_to admin_exercise_plans_path(user_id: @exercise_plan.user_id), success: 'エクササイズプランが作成されました'
    else
      flash.now['danger'] = 'エクササイズプランの作成に失敗しました'
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
      send_notification(@exercise_plan.user_id, 'エクササイズプランが更新されました。')
      redirect_to admin_exercise_plans_path(user_id: @exercise_plan.user_id), success: 'エクササイズプランが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @exercise_plan = ExercisePlan.find(params[:id])
    user_id = @exercise_plan.user_id
    @exercise_plan.destroy
    redirect_to admin_exercise_plans_path(user_id: user_id), success: 'エクササイズプランが削除されました'
  end

  private

  def set_user_id
    @user_id = params[:user_id]
  end

  def exercise_plan_params
    params.require(:exercise_plan).permit(:user_id, :training_menu, :description, :images_description, :movie_url, :images_cache, { images: [] })
  end

  def send_notification(user_id, message_text)
    user = User.find(user_id)
    return unless user.line_id

    message = {
      type: 'text',
      text: message_text
    }

    client.push_message(user.line_id, message)
  end
  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end
end
