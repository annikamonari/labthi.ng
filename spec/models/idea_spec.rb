require 'spec_helper'

describe Idea do
  it "is not valid without a phase" do
    article = Idea.create(phase: nil)
    article.should_not be_valid
  end
  it "is not valid without a brief" do
    article = Idea.create(brief: nil)
    article.should_not be_valid
  end
  it "is not valid without an industry" do
    article = Idea.create(industry: nil)
    article.should_not be_valid
  end
  it "is valid with a phase, brief, and industry" do
    article = Idea.create(phase:1, brief: "A website for crowdsourcing startup ideas", industry: "Internet")
    article.should be_valid
  end
end