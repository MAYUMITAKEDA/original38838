class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :destroy]
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    render "posts/show"
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :address, :category_id, :budget_id, :opening_hour_id, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    return if current_user.id == @post.user_id

    redirect_to root_path
  end
end
