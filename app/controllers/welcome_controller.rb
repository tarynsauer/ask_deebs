class WelcomeController < ApplicationController

  def index
    @user = current_user
    @questions = Question.search(params[:search])
    @answers = Answer.search(params[:search])
    @tags = Tag.order("taggings_count DESC")
  end
end
