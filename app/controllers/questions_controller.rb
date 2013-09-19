class QuestionsController < ApplicationController

  def index
    @questions = Question.all.to_a
  end

  def show
    @question = Question.find(params[:id])
  end

end
