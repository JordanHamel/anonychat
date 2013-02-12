class SurveysController < ApplicationController

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])

    if @survey.save
      flash[:success] = "Your survey has been submitted!"
      redirect_to results_surveys_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def results
    @results = Survey.all
  end
end
