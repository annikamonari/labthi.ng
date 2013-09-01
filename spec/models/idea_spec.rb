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
  it "is valid with a phase, brief, and category" do
    idea = Idea.create(
      phase:1,
      brief: "A website for crowdsourcing startup ideas",
      category_list: "Other",
      component_list: "App"
      )
    idea.should be_valid
  end

  it "should destroy associated aspect" do
    idea = FactoryGirl.create(:idea)
    aspect = FactoryGirl.create(:aspect, :idea => idea)
    expect {
        idea.destroy
      }.to change(Aspect, :count).by(-1)
  end

  it "should accept a category" do
    idea = FactoryGirl.create(:idea)
    idea.category_list = "retail, other"
    idea.category_list.should eq(["retail", "other"])
  end

end