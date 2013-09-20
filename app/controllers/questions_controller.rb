class QuestionsController < ApplicationController

  def index
    @questions = Question.all.to_a
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answers_sorted = @answers.sort! {|x, y| y.count_total_likes <=> x.count_total_likes }
  end

  def new
    @question = Question.new
  end

  def create
    if current_user
      @user = current_user
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
