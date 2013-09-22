class WelcomeController < ApplicationController

  def index
    @user = current_user

    if request.xhr?
      #show all questions on page load
      @questions = Question.search(params[:search])

      #only show answers if searched for
      params[:search].blank? ? @answers = nil : @answers = Answer.search(params[:search])

      render :partial => "live_search", :layout => false
    else
      @questions = Question.all
    end
  end
end
