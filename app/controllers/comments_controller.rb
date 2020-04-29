class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to content_path(comment.content_id), notice: '投稿しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end
