class QuestionsController < ApplicationController

  def index
    @questions = Question.all.to_a
  end

end
