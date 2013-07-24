require 'spec_helper'

describe "aspects/index" do
  before(:each) do
    assign(:aspects, [
      stub_model(Aspect,
        :title => "MyText"
      ),
      stub_model(Aspect,
        :title => "MyText"
      )
    ])
  end

  it "renders a list of aspects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
