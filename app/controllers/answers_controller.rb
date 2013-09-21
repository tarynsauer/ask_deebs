class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: current_user.id)

      if request.xhr?
        render :partial => "answer_item", :locals => {answer: @answer}
      else
        redirect_to @question
      end
    else
      redirect_to signin_path
    end

  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if request.xhr?

    else

    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.update(params[:id], :content => params[:answer][:content])
    redirect_to @question
  end

  def vote
    vote = Vote.find_or_create_by_user_id_and_answer_id(user_id: session[:user_id], answer_id: params[:answer_id], like: params[:like])
    vote.update(like: params[:like])

    if request.xhr?

      vote_count = Answer.find(params[:answer_id]).count_total_likes
      @data = { answer_id: params[:answer_id], count: vote_count }
      render json: @data
    else
      redirect_to question_path(params[:question_id])
    end

  end
end
