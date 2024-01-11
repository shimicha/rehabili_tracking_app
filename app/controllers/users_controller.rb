class UsersController < ApplicationController
    skip_before_action :require_login
    
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to new_top_path
        else
          render 'new'
        end
    end

    def show
      @user = User.find(params[:id])
      @exercise_plans = @user.exercise_plans
    end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

end
