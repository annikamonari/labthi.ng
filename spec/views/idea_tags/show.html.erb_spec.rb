require 'spec_helper'

describe "idea_tags/show" do
  before(:each) do
    @idea_tag = assign(:idea_tag, stub_model(IdeaTag,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
