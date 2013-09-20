class WelcomeController < ApplicationController

  def index
    @user = current_user
    @questions = Question.all
    @tags = Tag.order("taggings_count DESC")
  end
end
