require 'spec_helper'

describe "ideas/show" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @idea = FactoryGirl.create(
      :idea,
      :phase => 1,
      :brief => "MyText",
      :active => true,
      :industry => "Industry",
      :user => @user
    )
    @aspect = FactoryGirl.create(
      :aspect,
      :user => @user,
      :idea => @idea
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/true/)
    rendered.should match(/Industry/)
  end
end