class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @post.update(params[:id])
      redirect_to post_path
    else
      render :edit
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
