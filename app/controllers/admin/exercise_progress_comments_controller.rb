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
        redirect_to admin_users_path, notice: 'Comment was successfully added.'
      else
        render :new
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
end
