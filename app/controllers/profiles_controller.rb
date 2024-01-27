class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

def new
  @profile = Profile.new
end

def index
  @profile = current_user.profile
end

def edit
  @profile = current_user.profile
end

def create
  @profile = current_user.build_profile(profile_params)
  @profile.save
  redirect_to profiles_path
end


def update
  if @profile.update(profile_params)
    redirect_to profiles_path
  else
    render :edit
  end
end

private

def set_profile
  @profile = current_user.profile
end


  def profile_params
    params.require(:profile).permit(:age, :gender, :icon, :icon_cache, :history_of_present_illness, :contraindications, :medical_history, :surgery_history)
  end
end