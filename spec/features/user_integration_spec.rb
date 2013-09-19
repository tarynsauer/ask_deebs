require 'spec_helper'


describe "the signin process", :type => :feature do

  it "finds the Home screen" do
    visit '/'
    expect(page).to have_content 'Hello world'
  end

end
