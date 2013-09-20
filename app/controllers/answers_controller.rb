class AnswersController < ApplicationController

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: current_user.id)
  
      redirect_to @question
    else
      redirect_to @question
    end

  end

end
