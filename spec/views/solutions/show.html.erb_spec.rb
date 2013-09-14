require 'spec_helper'

describe "answers/show" do
  include Devise::TestHelpers
  before(:each) do
    @answer = FactoryGirl.create(:answer,
      :brief => "MyText"
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
