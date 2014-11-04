require 'spec_helper'

describe "comments/edit" do
  include Devise::TestHelpers
  before(:each) do
    @comment = FactoryGirl.build(:comment)
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "textarea#comment_brief[name=?]", "comment[brief]"
    end
  end
end
