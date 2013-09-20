require 'spec_helper'

describe "Welcome page" do
  before(:each) do
    question = Question.create(content: "The best Ruby resource?")
    question.answers.create(content: "Code School!")
  end
  
  it "should allow a user to visit a specific question page" do
    visit root_path
    click_link 'The best Ruby resource?'
    page.should have_content('Code School!')
  end

  it "should allow a user to visit a tags page" do
    visit root_path
    click_link "unix"
    page.should have_content('questions containing tag: unix')
  end

end
