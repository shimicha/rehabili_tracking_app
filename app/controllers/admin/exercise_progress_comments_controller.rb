class Admin::ExerciseProgressCommentsController < Admin::BaseController

  before_action :set_user_id, only: %i[new]

    def new
        @exercise_plans = ExercisePlan.where(user_id: @user_id)
        @exercise_progresses = ExerciseProgress.find(params[:exercise_progress_id])
        @exercise_progress_comments = ExerciseProgressComment.new
    end
    
    def create
        @exercise_progress_comments = ExerciseProgressComment.new(comment_params)
      if  @exercise_progress_comments.save
        send_line_notification(@exercise_progress_comments)
        redirect_to admin_users_path, success: 'コメントが作成されました'
      else
        redirect_to request.referrer, danger: "コメントの保存に失敗しました" 
      end
    end

    def index
        user_id = params[:user_id]
        @exercise_progresses = ExerciseProgress.where(user_id: user_id)
    end

    private
    
    def set_user_id
      @user_id = params[:user_id]
    end

    def comment_params
        params.require(:exercise_progress_comment).permit(:comment, :exercise_progress_id)
    end

    def send_line_notification(comment)
      exercise_progress = comment.exercise_progress
      user = User.find(exercise_progress.user_id)
      return unless user.line_id
  
      message = {
        type: 'text',
        text: "進捗にコメントがありました"
      }
  
      client.push_message(user.line_id, message)
    end
  
    private
  
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = ENV['LINE_CHANNEL_SECRET']
        config.channel_token = ENV['LINE_CHANNEL_TOKEN']
      }
    end
end
