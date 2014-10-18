require 'spec_helper'

describe Solution do
  it "is not valid without a brief" do
	  solution = FactoryGirl.build(:solution, brief: nil)
    solution.should_not be_valid
  end
  it "is not valid without a user" do
  	solution = FactoryGirl.build(:solution, user: nil)
  	solution.should_not be_valid
  end
  it "is not valid without an aspect" do
  	solution = FactoryGirl.build(:solution, aspect: nil)
  	solution.should_not be_valid
  end
  it "is not valid without an idea" do
    solution = FactoryGirl.build(:solution, idea: nil)
    solution.should_not be_valid
  end
  it "is not valid when brief is too long" do
  	solution = FactoryGirl.build(:solution, brief: "a" * 1251)
  	solution.should_not be_valid
  end

end