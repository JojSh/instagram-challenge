class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
    redirect_to "/pictures/#{@picture.id}"
  end


  def destroy
    @picture = Picture.find(params[:picture_id])
    Comment.delete(params[:id])
    flash[:notice] = 'Comment was deleted'
    redirect_to "/pictures/#{@picture.id}"
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
