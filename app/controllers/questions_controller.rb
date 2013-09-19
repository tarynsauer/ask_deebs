class QuestionsController < ApplicationController

  def index
    @questions = Question.all.to_a
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    if true
      @user = User.first
      @question = @user.questions.new(content: params[:question][:content])
      if @question.save
        @question.tags = params[:question][:tags]
        redirect_to @question
      else
        redirect_to new_question_path
      end
    else
      redirect_to signin_path
    end
  end



end
