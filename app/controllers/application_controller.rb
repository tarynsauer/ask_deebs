class ApplicationController < ActionController::Base

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def my_profile?
    current_user.id == params[:id].to_i
  end

  def my_answer?(answer)
    current_user.id == answer.user_id if logged_in?
  end

  def i_like?(answer)
    vote = Vote.find_by(user_id: @current_user.id, answer_id: answer.id)
    unless vote.nil?
      vote.like
    end
  end

  helper_method :current_user
  helper_method :logged_in?
  helper_method :my_profile?
  helper_method :my_answer?
  helper_method :i_like?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
