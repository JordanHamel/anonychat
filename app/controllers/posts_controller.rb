class PostsController < ApplicationController

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @post = Post.new(params[:post])
    @topic = Topic.find(@post.topic_id)

    if @post.save
      flash[:success] = "Your post has been saved!"
      redirect_to @post
    else
      flash[:error] = "Wrongzies..."
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: @post.id)
  end
end
