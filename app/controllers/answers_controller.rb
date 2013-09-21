class AnswersController < ApplicationController

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(content: params[:answer][:content])
      @answer.update(user_id: current_user.id)

      if request.xhr?
        render text: "<li> <%= answer.content %> | <span>LIKES: <%=answer.count_total_likes %></span>
      <% if current_user %>
        <%= link_to "Vote Up", vote_up_path(:answer_id => answer.id, :question_id => @question.id), method: :post  %> /
        <%= link_to "Vote Down", vote_down_path(:answer_id => answer.id, :question_id => @question.id), method: :post  %>
      <% end %>
      </li>"

      else
        redirect_to @question
      end
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
