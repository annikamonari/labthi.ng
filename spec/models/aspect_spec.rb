require 'spec_helper'

describe Aspect do
  it "is not valid without a brief" do
    aspect = Aspect.create(brief: nil)
    aspect.should_not be_valid
  end
  it "is valid with a brief" do
    aspect = Aspect.create(brief: "Valid brief")
    aspect.should be_valid
  end
end