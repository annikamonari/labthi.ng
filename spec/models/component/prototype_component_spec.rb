require 'rails_helper'

describe PrototypeComponent do

  it "creates its required parts" do
    expect{
      prototype_component = create(:prototype_component)
      }.to change(Part, :count).by(2)
  end

  context "method implementations" do
    before(:each) do 
      @prototype_component = create(:prototype_component)
    end

    it "responds to inherited name field" do
      expect(@prototype_component).to respond_to :name
    end

    it "responds to parts" do
      expect(@prototype_component).to respond_to :parts
    end

    it "responds to idea_build" do
      expect(@prototype_component).to respond_to :idea_build
    end
  end

end
