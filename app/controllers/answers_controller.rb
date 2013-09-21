class AnswersController < ApplicationController

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: current_user.id)

      if request.xhr?
        render text: "<li> #{@answer.content} | <span class= "count-"#{@answer.id}">LIKES:\
          "#{answer.count_total_likes}</span> if current_user<%= link_to "Vote Up",
           vote_path(:answer_id => answer.id, :question_id => @question.id),
            :data_question => "#{@question.id}", :id => "#{answer.id}", :class => "vote_up" %> /
        <%= link_to "Vote Down", vote_path(:answer_id => answer.id, :question_id => @question.id),
         :data_question => "#{@question.id}", :id => "#{answer.id}", :class => "vote_down" %>
        <% end %></li>"

      else
        redirect_to @question
      end
    else
      redirect_to signin_path
    end

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
