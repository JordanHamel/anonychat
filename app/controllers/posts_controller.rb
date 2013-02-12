class PostsController < ApplicationController

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @post = Post.new(params[:post])
    @topic = Topic.find(@post.topic_id)

    if @post.save
      respond_to do |format|
        format.html do
          flash[:success] = "Your post has been saved!"
          redirect_to @post
        end
        format.json do
          render :json => { errors: [], post: @post }
        end
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Wrongzies..."
          render "new"
        end
        format.json do
          render :json => { errors: ["Wrongzies..."], post: @post }
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: @post.id)

    respond_to do |format|
      format.html
      format.json do render :json => { post: @post,
        comments: @post.comments }
      end
    end
  end
end
