class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    p @question
    @question.answers.create(content: params[:answer][:content])
    # @answer = Answer.new(content: params[:answer][:content])
    # p @answer
    redirect_to @question

  end

end
