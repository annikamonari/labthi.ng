require 'spec_helper'

describe "ideas/edit" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :phase => 1,
      :brief => "MyText",
      :image => "MyString",
      :active => true,
      :activity_list => ["Science & Technology"]
    ))

    @categories = [
        "Arts & Entertainment",
        "Science & Technology",
        "Business & Finance",
        "Software & Internet",
        "Retail",
        "Education",
        "Energy & Utilities",
        "Food & Health",
        "Media & Communications",
        "Other"
      ]
  end

  it "renders the edit idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do
      assert_select "textarea#idea_brief[name=?]", "idea[brief]"
      assert_select "input#idea_industry[name=?]", "idea[industry]"
    end
  end
end
