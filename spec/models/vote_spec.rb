require 'spec_helper'

describe Vote do

  before(:each) do
    @vote = Vote.new(like: true)
  end

  it "should be valid when new" do
    @vote.should be_valid
  end

  it "should have content" do
    expect(@vote.like).to eq(true)
  end

end
