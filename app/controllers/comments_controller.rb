class CommentsController < ApplicationController
  def creeate
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = @post.comment
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
