require 'spec_helper'

describe User do
  let(:user) {User.new(:email => "bjohnson@gmail.com", :password => "password")}

  it "should be valid when new" do
    user.should be_valid
  end

  it "should respond to email" do
    user.should respond_to(:email)
  end

  it "should respond to password" do
    user.should respond_to(:password)
  end

  it "should not have an invalid email address" do
    test_user = User.create
    test_user.should_not be_valid
  end

  context "should have the required associations" do

    it "should respond to questions" do
      user.should respond_to(:questions)
    end

    it "should respond to followed questions" do
      user.should respond_to(:followed_questions)
    end

    it "should respond to answers" do
      user.should respond_to(:answers)
    end



  end

end
