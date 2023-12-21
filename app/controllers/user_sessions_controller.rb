class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password], params[:password_confirmation])
    if @user
      redirect_back_or_to new_top_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
