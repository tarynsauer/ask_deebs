require 'spec_helper'

describe Answer do
  before(:each) do
    @answer = Answer.new(content: "Rubymonk")
  end

  it "should be valid when new" do 
    @answer.should be_valid
  end

  it "should have content" do
    expect(@answer.content).to eq("Rubymonk")
  end

end
