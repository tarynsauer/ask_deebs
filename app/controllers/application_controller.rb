class ApplicationController < ActionController::Base
  
  
  def authenticated?
    !session[:oauth_token].nil?
  end

  def current_user
    @current_user ||= User.find_or_create_by(session[:user_attributes]) if session[:user_id]
  end

  helper_method :current_user 
  helper_method :authenticated?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
