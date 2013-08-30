require 'spec_helper'

describe "ideas/edit" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :phase => 1,
      :brief => "MyText",
      :image => "MyString",
      :active => true,
      :category_list => ["Science & Technology"]
    ))
  end

  it "renders the edit idea form" do
    assign :categories, []
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do
      assert_select "textarea#idea_brief[name=?]", "idea[brief]"
      assert_select "input#idea_industry[name=?]", "idea[industry]"
    end
  end
end
