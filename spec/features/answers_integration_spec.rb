require 'spec_helper'
require 'capybara'

describe 'New answer form' do
  before(:each) do
    @question = Question.create(content: "The best hot dog?")
  end

  it "should create a new answer to a question" do
    # visit question_path(@question)
    # fill_in "answer_content", :with => "this is the correct answer"
    # click_button 'Create Answer'
    # page.should have_content("this is the correct answer")
    pending
  end

end
