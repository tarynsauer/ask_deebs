class WelcomeController < ApplicationController

  def index
    @user = current_user
    @questions = Question.all
  end
end
