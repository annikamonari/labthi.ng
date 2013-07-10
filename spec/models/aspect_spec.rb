require 'spec_helper'

describe Aspect do
  it "is not valid without a brief and a user" do
    aspect = Aspect.create(brief: nil, user_id: nil)
    aspect.should_not be_valid
  end
  it "is not valid without a brief" do
    aspect = Aspect.create(brief: nil)
    aspect.should_not be_valid
  end
  it "is not valid without a user" do
    aspect = Aspect.create(brief: "Valid brief")
    aspect.should_not be_valid
  end
  it "is valid with a brief" do
    aspect = Aspect.create(brief: "Valid brief",
                            user: FactoryGirl.create(:user),
                            idea: FactoryGirl.create(:idea)
                            )
    aspect.should be_valid
  end

  it { should have_foreign_key_for(:ideas) }
end