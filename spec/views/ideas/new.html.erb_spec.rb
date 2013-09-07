require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
     :phase => 1,
     :brief => "MyText",
     :image => "MyString",
     :active => true
    ).as_new_record)

    @components = [
      "Website",
      "App",
      "Software",
      "Hardware",
      "Good",
      "Service"
    ]
    @categories = [
    "Advertising & Media",
    "Arts & Entertainment",
    "Business & Finance",
    "Education",
    "Energy & Utilities",
    "Food & Health",
    "Science & Technology",
    "Social",
    "Travel & Leisure",
    "Retail",
    "Other"
  ]
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ideas_path, "post" do
      assert_select "textarea#idea_brief[name=?]", "idea[brief]"
    end
  end
end
