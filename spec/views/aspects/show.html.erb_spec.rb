require 'spec_helper'

describe "aspects/show" do
  before(:each) do
  @aspect = FactoryGirl.create(:aspect,
    title: "MyTitle",
    brief: "MyBrief"
  )
  end
  after(:each)do
    @aspect.destroy
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyTitle/)
    rendered.should match(/MyBrief/)
  end
end
