class Admin::ProfilesController < Admin::BaseController
    before_action :set_user_id, only: %i[index new edit update]

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.new(profile_params)
        if @profile.save
          user_id = @profile.user_id 
          redirect_to admin_profiles_path(user_id: user_id)
        else
          render :new
        end
    end

    def index
        user_id = params[:user_id]
        @profile = Profile.find_by(user_id: user_id)
    end
  
    def edit
        user_id = params[:user_id]
        @profile = Profile.find_by(user_id: user_id)
    end
  
    def update
        @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to admin_profiles_path(user_id: @profile.user_id), notice: "プロフィールが更新されました。"
      else
        render :edit
      end
    end
  
    private

    def set_user_id
        @user_id = params[:user_id]
    end
  
    def profile_params
      params.require(:profile).permit(:user_id, :age, :gender, :icon, :icon_cache, :history_of_present_illness, :contraindications, :medical_history, :surgery_history)
    end

end
