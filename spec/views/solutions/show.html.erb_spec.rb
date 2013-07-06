require 'spec_helper'

describe "solutions/show" do
  before(:each) do
    @solution = assign(:solution, stub_model(Solution,
      :brief => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
