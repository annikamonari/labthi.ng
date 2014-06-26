require 'spec_helper'

describe IpComponent do
  it "creates its required parts" do
    expect{
      ip_component = create(:ip_component)
      }.to change(Part, :count).by(15)
  end

  context "method implementations" do
    before(:each) do 
      @ip_component = create(:ip_component)
    end

    it "responds to inherited name field" do
      expect(@ip_component).to respond_to :name
    end

    it "responds to parts" do
      expect(@ip_component).to respond_to :parts
    end

    it "responds to idea_build" do
      expect(@ip_component).to respond_to :idea_build
    end
  end

end
