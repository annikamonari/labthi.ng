require 'spec_helper'

describe Idea do
  it "is not valid without a phase" do
    idea = Idea.create(phase: nil)
    idea.should_not be_valid
  end
  it "is not valid without a brief" do
    idea = Idea.create(brief: nil)
    idea.should_not be_valid
  end
  it "is not valid without an industry" do
    idea = Idea.create(industry: nil)
    idea.should_not be_valid
  end
  it "is valid with a phase, brief, and industry" do
    idea = Idea.create(phase:1, brief: "A website for crowdsourcing startup ideas", industry: "Internet")
    idea.should be_valid
  end

  #it "should destroy associated profile" do
  #  idea = Idea.create(phase:1, brief: "A website for crowdsourcing startup ideas", industry: "Internet")
  #    expect {
  #      idea.destroy
  #    }.to change(Aspect, :count).by(-1)
  #end

end