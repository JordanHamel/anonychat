class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])

    if @topic.save
      flash[:success] = "Your topic has been created!"
      redirect_to @topic
    else
      flash[:error] = "Something went wrong. Try again!"
      render "new"
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def index
    @topics = Topic.all
  end
end
