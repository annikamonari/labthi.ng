require 'spec_helper'

describe "ideas/index" do
  before(:each) do
    assign(:ideas, [
      stub_model(Idea,
        :phase => 1,
        :brief => "MyText",
        :image => "Image",
        :active => false,
        :industry => "Industry"
      ),
      stub_model(Idea,
        :phase => 1,
        :brief => "MyText",
        :image => "Image",
        :active => false,
        :industry => "Industry"
      )
    ])
  end

  it "renders a list of ideas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Industry".to_s, :count => 2
  end
end
