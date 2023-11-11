class PostsController < ApplicationController

  before_action :set_training_menu, only: [:show, :edit, :update, :destroy]

    def new
      @post = Post.new
      @titles = TrainingMenu.pluck(:title)
    end
  
    def create
      @post = current_user.posts.build(post_params)
        if @post.save
      redirect_to '#'
    else
      render :new
    end
  end
  
    private
  
    def set_training_menu
      @training_menu = TrainingMenu.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title)
    end
  end