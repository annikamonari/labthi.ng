require 'spec_helper'


def create_idea
  valid_attributes = { "phase" => "1", "brief" => "lorem ipsum dolor sit amet", "industry" => "Technology"}
  idea = Idea.create! valid_attributes
end

describe "aspects/show" do
  before(:each) do
    idea = create_idea
    @aspect = assign(:aspect, stub_model(Aspect,
      :title => "MyTitle",
      :brief => "MyText",
      :idea => idea
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyTitle/)
  end
end
