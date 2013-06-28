require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :phase => 1,
      :brief => "MyText",
      :image => "MyString",
      :active => false,
      :industry => "MyString"
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ideas_path, "post" do
      assert_select "input#idea_phase[name=?]", "idea[phase]"
      assert_select "textarea#idea_brief[name=?]", "idea[brief]"
      assert_select "input#idea_image[name=?]", "idea[image]"
      assert_select "input#idea_active[name=?]", "idea[active]"
      assert_select "input#idea_industry[name=?]", "idea[industry]"
    end
  end
end
