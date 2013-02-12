class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      flash[:success] = "Your comment has been added."
      redirect_to post_path(@post)
    else
      flash[:error] = "Your post wasn't saved. Try again?"
      redirect_to post_path(@post)
    end
  end
end
