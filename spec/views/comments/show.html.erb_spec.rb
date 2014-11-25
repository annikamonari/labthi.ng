require 'rails_helper'

describe "comments/show" do
  include Devise::TestHelpers
  before(:each) do
    @comment = FactoryGirl.create(:comment,
      :brief => "MyText"
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
