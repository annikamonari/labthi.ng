require 'spec_helper'

describe "ideas/show" do
  before(:each) do
    @idea = FactoryGirl.create(
      :idea,
      :phase => 1,
      :brief => "MyText",
      :image => "Image",
      :active => true,
      :industry => "Industry"
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/true/)
    rendered.should match(/Industry/)
  end

  it "displays any aspects" do
    render
    rendered.should match(/Valid title/)
    rendered.should match(/Valid brief/)
  end
end