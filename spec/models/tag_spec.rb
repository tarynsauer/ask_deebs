require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.create(name: "Ruby")
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

  it "should not add new tag if not unique" do
    expect { Tag.create(name: "Ruby") }.to_not change{Tag.count}.by(1)
  end

  it "should respond to taggings_count" do
    @tag.should respond_to(:taggings_count)
  end
end
