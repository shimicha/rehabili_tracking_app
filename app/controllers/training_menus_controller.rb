class TrainingMenusController < ApplicationController
  def new
    @training_menu = TrainingMenu.new
  end

  def create
    @training_menu = current_user.training_menus.build(training_menu_params)
    if @training_menu.save
      redirect_to '#'
    else
      render :new
    end
  end

  def index
    @training_menu = current_user.training_menu
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:title, :description)
  end
end
