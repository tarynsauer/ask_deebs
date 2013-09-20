class AnswersController < ApplicationController

  def create
    if true
      @user = User.first
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: @user.id)
      # @answer = Answer.new(content: params[:answer][:content])
      # p @answer
      redirect_to @question
    else
      redirect_to @question
    end

  end

  def vote_up
    vote = Vote.find_or_create_by_user_id_and_answer_id(answer_id: params[:answer_id], like: params[:like])
    vote.update(like: true)
    redirect_to question_path(params[:question_id])
  end

  def vote_down
    vote = Vote.find_or_create_by_user_id_and_answer_id(answer_id: params[:answer_id], like: params[:like])
    vote.update(like: false)
    redirect_to question_path(params[:question_id])
  end

end
