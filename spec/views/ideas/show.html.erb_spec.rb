require 'spec_helper'

def create_aspect
  user = FactoryGirl.create(:user)
  valid_attributes = { "phase" => "1", "brief" => "lorem ipsum dolor sit amet", "industry" => "Technology", "user_id" => user}
  idea = Aspect.create! valid_attributes
end

describe "ideas/show" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :phase => 1,
      :brief => "MyText",
      :image => "Image",
      :active => false,
      :industry => "Industry"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/false/)
    rendered.should match(/Industry/)
  end
end
