class CommentsController < ApplicationController
  before_action :find_comment, :only => [:destroy]
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    redirect_to :back
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
