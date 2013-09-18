require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.new(name: "Ruby")
  end

  it "should be valid when new" do
    @tag.should be_valid
  end

  it "should have content" do
    expect(@tag.name).to eq("Ruby")
  end

  it "should respond to questions" do
    @tag.should respond_to(:questions)
  end
end
