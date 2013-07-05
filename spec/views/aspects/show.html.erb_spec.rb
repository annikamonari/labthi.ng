require 'spec_helper'

describe "aspects/show" do
  before(:each) do
    @aspect = assign(:aspect, stub_model(Aspect,
      :brief => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
