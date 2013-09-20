class WelcomeController < ApplicationController

  def index
    @user = current_user
    # @questions = Question.all
    @questions = Question.search(params[:search])
  end
end
