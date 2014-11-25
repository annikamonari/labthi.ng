require 'rails_helper'

describe Part do
  before(:each) do
    @part = create(:part)
  end

  it "responds to name" do
    expect(@part).to respond_to :name
  end

  it "responds to value" do
    expect(@part).to respond_to :value
  end

  it "responds to user" do
    expect(@part).to respond_to :user
  end

  it "responds to component" do
    expect(@part).to respond_to :component
  end

  it "responds to idea" do
    expect(@part).to respond_to :idea
  end

  it "retrieves an idea" do
    expect(@part.idea).to_not be nil
  end
end
