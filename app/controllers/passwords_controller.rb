class PasswordsController < ApplicationController
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(password_params)
      redirect_to new_top_path, notice: 'Password was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
