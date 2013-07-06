require 'spec_helper'

describe "solutions/new" do
  before(:each) do
    assign(:solution, stub_model(Solution,
      :brief => "MyText"
    ).as_new_record)
  end

  it "renders new solution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", solutions_path, "post" do
      assert_select "textarea#solution_brief[name=?]", "solution[brief]"
    end
  end
end
