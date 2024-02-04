class Admin::BaseController < ApplicationController
    before_action :check_admin
    layout 'admin/layouts/application'
    add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to admin_login_path
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
