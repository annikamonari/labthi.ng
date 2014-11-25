require 'rails_helper'

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
    answer = FactoryGirl.build(:answer)
    comment = Comment.create(brief: "Valid message",
                           user: FactoryGirl.create(:user),
                           commentable_id: answer.id,
                           commentable_type: answer.class.to_s
    )
    comment.should be_valid
  end
  it "is not valid when it is too long" do
    comment = FactoryGirl.create(:comment)
    comment.brief = "a" * 501
    comment.should_not be_valid
  end
end