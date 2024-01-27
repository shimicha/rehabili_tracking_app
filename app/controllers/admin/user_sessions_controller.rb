class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]
  layout 'admin/layouts/admin_login'     
  
  def new; end

  def create
    @user = login(params[:email], params[:password])
    
    if @user
      redirect_back_or_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    logout                                     
    redirect_to admin_login_path
  end
end
