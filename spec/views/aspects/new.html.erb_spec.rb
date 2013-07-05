require 'spec_helper'

describe "aspects/new" do
  before(:each) do
    assign(:aspect, stub_model(Aspect,
      :brief => "MyText"
    ).as_new_record)
  end

  it "renders new aspect form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aspects_path, "post" do
      assert_select "textarea#aspect_brief[name=?]", "aspect[brief]"
    end
  end
end
