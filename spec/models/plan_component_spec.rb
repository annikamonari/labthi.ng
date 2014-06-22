require 'spec_helper'

describe PlanComponent do

  it "responds to inherited name field" do
    @plan_component = create(:plan_component)
    expect(@plan_component).to respond_to :name
  end

  it "creates its required parts" do
    expect{
      @plan_component = create(:plan_component)
      }.to change(Part, :count).by(5)
  end
end
