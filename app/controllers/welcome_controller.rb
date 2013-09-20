class WelcomeController < ApplicationController

  def index
    @user = current_user
    @questions = Question.search(params[:search])
    if params[:search].blank?
      @answers = nil
    else
      @answers = Answer.search(params[:search])
    end
    @tags = Tag.order("taggings_count DESC")
  end
end
