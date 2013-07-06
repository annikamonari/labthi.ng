require 'spec_helper'

describe "idea_tags/index" do
  before(:each) do
    assign(:idea_tags, [
      stub_model(IdeaTag,
        :name => "Name"
      ),
      stub_model(IdeaTag,
        :name => "Name"
      )
    ])
  end

  it "renders a list of idea_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
