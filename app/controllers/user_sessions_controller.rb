class UserSessionsController < ApplicationController
    def new; end

  def create
    @user = login(params[:email], params[:password], params[:password_digest])
    if @user
      redirect_back_or_to "#"
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to "#"
  end
end
