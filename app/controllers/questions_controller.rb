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
    @question = Question.new(params[:question])

    # Create callback in Question model to parse tags
    p params[:question][:tags]

    # @tags = params[:tags].map { |tag| tag.strip }
    # @tags.each do |tag|
    #   @question.tags.find_or_create_by(name: tag)
    # end
    # redirect_to @question
  end


end
