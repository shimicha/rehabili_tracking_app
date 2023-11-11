class Admin::TherapistUsersController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]

def new
  @therapist_user = TherapistUser.new
end

def create
  @therapist_user = TherapistUser.new(therapist_user_params)
    if @therapist_user.save
     
      redirect_to "#", notice: 'Admin created successfully.'
    else
      render :new
    end
end

private

  def therapist_user_params
    params.require(:therapist_user).permit(:name, :email, :password, :password_confirmation)
  end

end
