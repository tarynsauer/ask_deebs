require 'spec_helper'

describe "Welcome page" do
  before(:each) do
    question = Question.create(content: "The best Ruby resource?")
    question.answers.create(content: "Code School!")
    question.answers.create(content: "Eloquent Ruby!")
    visit root_path
  end
  
  it "should allow a user to visit a specific question page" do
    click_link 'The best Ruby resource?'
    page.should have_content('Code School!')
  end


  it "should allow a user to visit a tags page" do
    visit root_path
    click_link "unix"
    page.should have_content('questions containing tag: unix')

  end

  describe "search" do
    context "when no search is entered" do
      it "should not show answers" do
        page.should_not have_content('Code')
      end
    end

    context "when a search is entered" do
      it "should show answer results" do
        fill_in "search", :with => "Code"
        click_button "Search"
        page.should have_content("Code School!")
      end

      it "should return both question and answers matching term" do
        fill_in "search", :with => "Ruby" 
        click_button "Search"
        page.should have_content("The best Ruby resource?")
        page.should have_content("Eloquent Ruby!")
      end

      it "should not return non-matching answer results" do
        fill_in "search", :with => "Ruby"
        click_button "Search"
        page.should_not have_content("Code School!")
      end


    end

  end

end
