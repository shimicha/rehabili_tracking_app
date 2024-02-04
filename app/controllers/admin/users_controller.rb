class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: %i[destroy]

    def index
        @users = User.all
    end

    def destroy
        @user.destroy!
        redirect_to admin_users_path, success: 'ユーザーを削除しました'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
