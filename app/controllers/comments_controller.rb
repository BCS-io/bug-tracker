class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build comment_params
    @comment.account = current_account
    @comment.save
    redirect_to @commentable, notice: "success"
    authorize @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:words)
  end
end
