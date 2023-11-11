class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]
  layout 'admin/layouts/admin_login'     
  
  def new; end

  def create
    @user = login(params[:admin_name], params[:password], params[:password_confirmation])
    if @user
      redirect_to "#", success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout                                     
    redirect_to admin_login_path, success: 'ログアウトしました'
  end
end
