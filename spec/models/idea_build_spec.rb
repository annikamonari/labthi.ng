require 'spec_helper'

describe IdeaBuild do
  describe "responses" do
    before (:each) do
      @idea_build = create(:idea_build)
    end

    it "responds_to plan_component" do
      expect(@idea_build).to respond_to :plan_component
    end

    it "responds_to ip_component" do
      expect(@idea_build).to respond_to :ip_component
    end

    it "respond_to business_plan_component" do
      expect(@idea_build).to respond_to :business_plan_component
    end

    it "respond_to prototype_component" do
      expect(@idea_build).to respond_to :prototype_component
    end

    it "respond_to design_component" do
      expect(@idea_build).to respond_to :design_component
    end
  end

  describe "automatic creations" do

    it "creates a plan component" do
      expect {
        create(:idea_build)
      }.to change(PlanComponent, :count).by(1)
    end
    
    it "creates an ip component" do
      expect {
        create(:idea_build)
      }.to change(IpComponent, :count).by(1)
    end

    it "creates a business plan component" do
      expect {
        create(:idea_build)
      }.to change(BusinessPlanComponent, :count).by(1)
    end

    it "creates a prototype component" do
      expect {
        create(:idea_build)
      }.to change(PrototypeComponent, :count).by(1)
    end
    it "creates a design component" do
      expect {
        create(:idea_build)
      }.to change(DesignComponent, :count).by(1)
    end
  end
end
