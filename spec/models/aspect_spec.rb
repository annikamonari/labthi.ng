require 'rails_helper'

describe Aspect do
  it "is not valid without a title" do
    aspect = Aspect.create(title: nil)
    aspect.should_not be_valid
  end
  it "is valid with a title" do
    aspect = Aspect.create(title: "Valid brief")
    aspect.should be_valid
  end
end