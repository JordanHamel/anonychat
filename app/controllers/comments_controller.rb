class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = "Your comment has been added."
          redirect_to post_path(@post)
        end
        format.json { render json: { errors: [], comment: @comment } }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Your post wasn't saved. Try again?"
          redirect_to post_path(@post)
        end
        format.json do render json: {
          errors: ["Your post wasn't saved. Try again?"],
          comment: @comment }
        end
      end
    end
  end
end
