require 'spec_helper'

describe BusinessPlanComponent do

  it "creates its required parts" do
    expect{
      business_plan_component = create(:business_plan_component)
      }.to change(Part, :count).by(8)
  end

  context "method implementations" do
    before(:each) do 
      @business_plan_component = create(:business_plan_component)
    end

    it "responds to inherited name field" do
      expect(@business_plan_component).to respond_to :name
    end

    it "responds to parts" do
      expect(@business_plan_component).to respond_to :parts
    end

    it "responds to idea_build" do
      expect(@business_plan_component).to respond_to :idea_build
    end
  end

end
