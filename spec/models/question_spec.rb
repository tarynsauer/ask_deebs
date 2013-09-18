require 'spec_helper'

describe Question do
  before(:each) do
    @question = Question.new(content: "What is the best Ruby tutorial?")
  end

  it "should have attribute content" do
    expect(@question.content).to eq("What is the best Ruby tutorial?")
  end
end
