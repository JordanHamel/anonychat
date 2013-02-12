class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Your profile has been created!"
      redirect_to @user
    else
      flash[:error] = "Try again?"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
