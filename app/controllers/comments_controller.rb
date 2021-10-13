class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @comment = Comment.new(comments_params)
    ActionCable.server.broadcast 'comments_channel', { comment: @comment, account: @comment.account } if @comment.save
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
          .merge(account_id: current_user.id, post_id: params[:post_id])
  end
end
