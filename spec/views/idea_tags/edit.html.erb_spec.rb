require 'spec_helper'

describe "idea_tags/edit" do
  before(:each) do
    @idea_tag = assign(:idea_tag, stub_model(IdeaTag,
      :name => "MyString"
    ))
  end

  it "renders the edit idea_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", idea_tag_path(@idea_tag), "post" do
      assert_select "input#idea_tag_name[name=?]", "idea_tag[name]"
    end
  end
end
