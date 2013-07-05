require 'spec_helper'

describe "aspects/edit" do
  before(:each) do
    @aspect = assign(:aspect, stub_model(Aspect,
      :brief => "MyText"
    ))
  end

  it "renders the edit aspect form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aspect_path(@aspect), "post" do
      assert_select "textarea#aspect_brief[name=?]", "aspect[brief]"
    end
  end
end
