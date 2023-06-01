class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :move_to_index]
  before_action :move_to_index, only: :edit
  def show
    @posts = @user.posts
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && current_user.id == @user.id

    redirect_to root_path
  end
end
