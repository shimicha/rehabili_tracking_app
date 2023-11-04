class PostsController < ApplicationController

    before_action :set_training_menu, only: [:new, :create]

    def new
      @post = @training_menu.posts.build
    end
  
    def create
      @post = @training_menu.posts.build(post_params)
      if @post.save
        redirect_to training_menu_post_path(@training_menu, @post), notice: '投稿が作成されました。'
      else
        render :new
      end
    end
  
    private
  
    def set_training_menu
      @training_menu = TrainingMenu.find(params[:training_menu_id])
    end
  
    def post_params
      params.require(:post).permit(:content, :training_menu_id)
    end
  end