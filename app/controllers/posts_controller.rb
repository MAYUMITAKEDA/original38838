class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :set_post_form, only: [:create, :update]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post_form = PostForm.new
  end

  def create
    if @post_form.valid?
      @post_form.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def show
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags.first&.tag_name
  end

  def update
    @post_form.image ||= @post.image.blob
    if @post_form.valid? 
      @post_form.update(post_form_params, @post)
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

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(" ")
    end
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  private

  def post_form_params
    params.require(:post_form).permit(:title, :text, :address, :category_id, :budget, :opening_hour_id, :tag_name, :area_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_form
    @post_form = PostForm.new(post_form_params)
  end

  def move_to_index
    return if current_user.id == @post.user_id

    redirect_to root_path
  end
end
