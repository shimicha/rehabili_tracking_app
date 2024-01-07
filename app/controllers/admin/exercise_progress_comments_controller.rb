class Admin::ExerciseProgressCommentsController < Admin::BaseController

    def new
        @exercise_plans = ExercisePlan.all
        @exercise_progresses = ExerciseProgresse.all
        @exercise_progress_comments = ExerciseProgressComment.new
    end
    
    def create
        @exercise_progress_comments = ExerciseProgressComment.new(comment_params)

      if  @exercise_progress_comments.save
        redirect_to new_admin_exercise_progress_comment_path, notice: 'Comment was successfully added.'
      else
        render :new
      end
    end

    private

    def comment_params
        params.require(:exercise_progress_comment).permit(:comment)
    end
end
