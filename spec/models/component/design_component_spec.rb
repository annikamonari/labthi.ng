require 'spec_helper'

describe DesignComponent do
  it "creates its required parts" do
    expect{
      design_component = create(:design_component)
      }.to change(Part, :count).by(6)
  end

  context "method implementations" do
    before(:each) do 
      @design_component = create(:design_component)
    end

    it "responds to inherited name field" do
      expect(@design_component).to respond_to :name
    end

    it "responds to parts" do
      expect(@design_component).to respond_to :parts
    end

    it "responds to idea_build" do
      expect(@design_component).to respond_to :idea_build
    end
  end

end
