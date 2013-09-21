class QuestionsController < ApplicationController

  def index
    # @questions = Question.all.to_a
    @questions = Question.search(params[:search])
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answers_sorted = @answers.sort! {|x, y| y.count_total_likes <=> x.count_total_likes }
  end

  def new
    if request.xhr?
      @question = Question.new
      render layout: false
    else
      @question = Question.new
    end
  end

  def edit
    @question = params[:id]
  end

  def create
    if current_user
      @user = current_user
      @question = @user.questions.new(title: params[:question][:title], 
                                      content: params[:question][:content])
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

  def follow
    @question = Question.find(params[:id])
    @question.followers << current_user
    redirect_to @question
  end

  def unfollow
    @question = Question.find(params[:id])
    current_user.followed_questions.delete(@question)
    redirect_to @question
  end

end
