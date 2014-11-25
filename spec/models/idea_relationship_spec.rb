require 'rails_helper'

describe IdeaRelationship do
  before :each do
    @idea_relationship = build(:idea_relationship)
  end

  it "responds to follower_id" do
    expect(@idea_relationship).to respond_to :follower_id
  end
  it "responds to followed_id" do
    expect(@idea_relationship).to respond_to :followed_id
  end
end
