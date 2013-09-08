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
  it "is not valid without a commentable" do
    comment = Comment.create(commentable_id: nil)
    comment.should_not be_valid
  end
  it "is valid with a message, user, and commentable" do
    solution = FactoryGirl.build(:solution)
    comment = Comment.create(brief: "Valid message",
                           user: FactoryGirl.create(:user),
                           commentable_id: solution.id,
                           commentable_type: solution.class.to_s
    )
    comment.should be_valid
  end

  it { should have_foreign_key_for(:users) }
end