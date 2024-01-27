class UserSessionsController < ApplicationController
    def new; end

  def create
    @user = login(params[:email], params[:password], params[:password_digest])
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
