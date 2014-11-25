require 'rails_helper'

describe Answer do
  it "is not valid without a brief" do
	answer = FactoryGirl.build(:answer, brief: nil)
    answer.should_not be_valid
  end
  it "is not valid without a user" do
  	answer = FactoryGirl.build(:answer, user: nil)
  	answer.should_not be_valid
  end
  it "is not valid without a question" do
  	answer = FactoryGirl.build(:answer, question: nil)
  	answer.should_not be_valid
  end
  it "is not valid when brief is too long" do
  	answer = FactoryGirl.build(:answer, brief: "a" * 1001)
  	answer.should_not be_valid
  end

end