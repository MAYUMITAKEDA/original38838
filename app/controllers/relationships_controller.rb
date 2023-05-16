class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:create, :destroy]

  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to user_path(@user.id)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to user_path(@user.id)
  end

  def set_relationship
    @user = User.find(params[:user_id])
  end
end
