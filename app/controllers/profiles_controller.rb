class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

def new
  if current_user.profile.present?
    redirect_to edit_profile_path(current_user.profile)
  else
    @profile = Profile.new
  end
end

def index
  @profile = current_user.profile
end

def edit
  @profile = current_user.profile
end

def create
  @profile = current_user.build_profile(profile_params)
  if @profile.save
  redirect_to profiles_path, success: 'プロフィール作成しました'
  else
  flash.now['danger'] = 'プロフィール作成に失敗しました'
  render :new
  end
end


def update
  if @profile.update(profile_params)
    redirect_to profiles_path, success: 'プロフィールが更新されました'
  else
    flash.now['danger'] = 'プロフィールの更新に失敗しました'
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