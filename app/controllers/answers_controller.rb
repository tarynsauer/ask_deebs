class AnswersController < ApplicationController

  def create
    if current_user
      @user = current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: @user.id)
      # @answer = Answer.new(content: params[:answer][:content])
      # p @answer
      redirect_to @question
    else
      redirect_to signin_path
    end

  end

end
