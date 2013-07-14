require 'spec_helper'

describe Comment do
  it "is not valid without a brief" do
    comment = Comment.create(brief: nil)
    comment.should_not be_valid
  end
  it "is not valid without a user" do
    comment = Comment.create(user: nil)
    comment.should_not be_valid
  end
  it "is not valid without a solution" do
    comment = Comment.create(solution: nil)
    comment.should_not be_valid
  end
  it "is valid with a message, user, and solution" do
    comment = Comment.create(brief: "Valid message",
                           user: FactoryGirl.create(:user),
                           solution: FactoryGirl.create(:solution)
    )
    comment.should be_valid
  end

  it { should have_foreign_key_for(:users) }
end