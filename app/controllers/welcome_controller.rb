class WelcomeController < ApplicationController

  def index
    @user = current_user

    if request.xhr?
      if params[:search].blank?
        @questions = Question.limit(20).order("created_at DESC")
        @answers = nil 
        @count = nil
      else
        @questions = Question.search(params[:search]).order("created_at DESC")
        @answers = Answer.search(params[:search]).order("created_at DESC")
        @count = @questions.count
      end
      render :partial => "live_search", :layout => false
    else
      @questions = Question.limit(20).order("created_at DESC")
    end
  end
end
