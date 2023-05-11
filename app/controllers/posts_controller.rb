class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path      
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :address, :category_id, :budget_id, :opening_hour_id, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
