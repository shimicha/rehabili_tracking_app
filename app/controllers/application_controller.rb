class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger
    protect_from_forgery
    before_action :require_login

    private

    def not_authenticated
        redirect_to login_path
    end
end
