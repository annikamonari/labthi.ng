require 'spec_helper'

describe Component do
  before (:each) do
    @component = build(:component)
  end

  it "responds to name" do
    expect(@component).to respond_to :name
  end

  it "responds to idea_build" do
    expect(@component).to respond_to :idea_build
  end

  it "responds to parts" do
    expect(@component).to respond_to :parts
  end
end
