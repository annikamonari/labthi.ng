require 'rails_helper'

describe Idea do
  it "is not valid without a title" do
    idea = Idea.create(title: nil)
    idea.should_not be_valid
  end
  it "is not valid without a phase" do
    idea = Idea.create(phase: nil)
    idea.should_not be_valid
  end
  it "is not valid without a brief" do
    idea = Idea.create(brief: nil)
    idea.should_not be_valid
  end
  it "is valid with a title, phase, brief, and category" do
    idea = FactoryGirl.create(:idea,
      phase:1,
      title: "Crowdsourcing Ideas",
      brief: "A website for crowdsourcing startup ideas",
      category_list: "Other",
      component_list: "App"
      )
    idea.should be_valid
  end

  it "should accept a category" do
    idea = FactoryGirl.create(:idea)
    idea.category_list = "retail, other"
    idea.category_list.should eq(["retail", "other"])
  end
  describe "when title is too long" do
    idea = FactoryGirl.create(:idea)
    before {idea.title = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when brief is too long" do
    idea = FactoryGirl.create(:idea)
    before {idea.brief = "a" * 501 }
    it { should_not be_valid }
  end

  describe "idea promotion" do
    before(:each) do
      @idea = FactoryGirl.create(:idea)
    end

    it "creates a new IdeaBuild object" do
      expect {
        @idea.promote!
      }.to change(IdeaBuild, :count).by(1)
    end
  end
end