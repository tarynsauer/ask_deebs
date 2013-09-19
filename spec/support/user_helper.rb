require 'spec_helper'

def create_session
  @user = User.create(email: 'a@b.com', password:'a')
  session[:user_id] = @user.id
end
