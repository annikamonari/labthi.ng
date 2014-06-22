require 'spec_helper'

describe PlanComponent do

  it "creates its required parts" do
    expect{
      plan_component = create(:plan_component)
      }.to change(Part, :count).by(5)
  end

  context "method implementations" do
    before(:each) do 
      @plan_component = create(:plan_component)
    end

    it "responds to inherited name field" do
      expect(@plan_component).to respond_to :name
    end

    it "responds to parts" do
      expect(@plan_component).to respond_to :parts
    end

    it "responds to idea_build" do
      expect(@plan_component).to respond_to :idea_build
    end
  end

end
