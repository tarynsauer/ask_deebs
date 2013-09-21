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

  context "when a logged-in user clicks the ASK DEEBs logo" do
    before(:each) do
      # @user = User.create(:oauth_token => 1234, :email=> 'user@example.com',
      # :avatar_url => 'http://example.com/image', :name=> 'Example User')
      session = Capybara::Session.new(:user_id, 6)
    end

    it "should reload the home page" do
      session.click_link "ASK DEEBs"
      page.should have_content("taryn.sauer@gmail.com")
    end
  end

  context "when a non-logged in user clicks the ASK DEEBs logo" do
    it "should reload the home page" do
      click_link "ASK DEEBs"
      page.should have_content("Sign In")
    end
  end

end
