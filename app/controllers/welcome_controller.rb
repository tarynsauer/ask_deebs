class WelcomeController < ApplicationController

  def index
    @user = current_user
    
    if request.xhr?
      @questions = Question.search(params[:search])
      render :partial => "live_search", :layout => false
    else
      @questions = Question.all
    end

    #show all questions even without searching
    # @questions = Question.search(params[:search])

    # #don't show answers unless searched for
    # if params[:search].blank?
    #   @answers = nil
    # else
    #   @answers = Answer.search(params[:search])
    # end
    
    @tags = Tag.order("taggings_count DESC")
  end
end
