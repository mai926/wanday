class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      ActionCable.server.broadcast "comments_channel", {comment: @comment, account: @comment.account}
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
      .merge(account_id: current_user.id, post_id: params[:post_id])
  end
end
