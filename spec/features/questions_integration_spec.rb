require 'spec_helper'
require 'capybara'

describe 'New question form' do


  it "should create a new question with tags" do
    visit new_question_path
    fill_in "question_content", :with => "What is the best JS tutorial?"
    fill_in "question_tags", :with => "javascript, learning"
    click_button 'Create Question'
    page.should have_content("the best JS tutorial?")
  end

end
