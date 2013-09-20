class AnswersController < ApplicationController

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: current_user.id)
  
      redirect_to @question
    else
      redirect_to signin_path
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
