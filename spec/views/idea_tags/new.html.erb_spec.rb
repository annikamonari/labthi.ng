require 'spec_helper'

describe "idea_tags/new" do
  before(:each) do
    assign(:idea_tag, stub_model(IdeaTag,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new idea_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", idea_tags_path, "post" do
      assert_select "input#idea_tag_name[name=?]", "idea_tag[name]"
    end
  end
end
