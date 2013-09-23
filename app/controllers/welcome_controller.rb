class WelcomeController < ApplicationController

  def index
    @user = current_user

    if request.xhr?
      if params[:search].blank?
        @questions = Question.limit(20).order("created_at DESC")
        @answers = nil 
        @count = nil
        @title = "Recent Results"
      else
        @questions = Question.search(params[:search]).order("created_at DESC")
        @answers = Answer.search(params[:search]).order("created_at DESC")
        @count = @questions.count
        @title = "Question Matches"
      end
      render :partial => "live_search", :layout => false
    else
      @title = "Recent Results"
      @questions = Question.limit(20).order("created_at DESC")
    end
  end
end
