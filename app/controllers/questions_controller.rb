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
    @question = Question.new(content: params[:question][:content])
    
    if @question.save
      tags_array = params[:question][:tags].split(",")
      @tags = tags_array.map { |tag| tag.strip }
      
      @tags.each do |tag|
        @question.tags.find_or_create_by(name: tag)
      end
      redirect_to @question
    else
      redirect_to new_question_path
    end
  end


end
