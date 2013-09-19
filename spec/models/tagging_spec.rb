require 'spec_helper'

describe Tagging do
  before(:each) do
    @tagging = Tagging.new(question_id: 1, tag_id: 1)
  end

  it "should be valid when new" do
    @tagging.should be_valid
  end

  it "should respond to question" do
    @tagging.should respond_to(:question)
  end

  it "should respond to tag" do
    @tagging.should respond_to(:tag)
  end
end
