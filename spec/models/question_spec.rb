require 'spec_helper'

describe Question do
  it "is not valid without a title" do
		question = FactoryGirl.build(:question, title: nil)
    question.should_not be_valid
  end
  it "is not valid without a user" do
		question = FactoryGirl.build(:question, user: nil)
    question.should_not be_valid
  end
  it "is not valid without a idea" do
		question = FactoryGirl.build(:question, idea: nil)
    question.should_not be_valid
  end
  it "is not valid without an answers_expected" do
		question = FactoryGirl.build(:question, answers_expected: nil)
    question.should_not be_valid
  end
  it "is valid without a brief" do
		question = FactoryGirl.build(:question, brief: nil)
    question.should be_valid
  end
  it "is valid with a title, brief, and answers_expected" do
    question = Question.create(
	  	title: "What material would the product be made of?",
      brief: "The jacket must be durable and warm.",
      answers_expected: 2,
      user: FactoryGirl.create(:user),
      idea: FactoryGirl.create(:idea)
      )
    question.should be_valid
  end
end