class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])

    if @topic.save
      respond_to do |format|
        format.html do
          flash[:success] = "Your topic has been created!"
          redirect_to @topic
        end
        format.json { render json: { errors: [], topic: @topic } }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Something went wrong. Try again!"
          render "new"
        end
        format.json do render json: {
          errors: ["Something went wrong. Try again!"],
          topic: @topic }
        end
      end
    end
  end

  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @topic }
    end
  end

  def index
    @topics = Topic.all
  end
end
