require 'spec_helper'

describe Comment do
  it "is not valid without a message" do
    comment = Comment.create(message: nil)
    comment.should_not be_valid
  end
  it "is not valid without a user" do
    comment = Comment.create(user: nil)
    comment.should_not be_valid
  end
  it "is not valid without an aspect" do
    comment = Comment.create(aspect: nil)
    comment.should_not be_valid
  end
  it "is valid with a message, user, and aspect" do
    comment = Comment.create(message: "Valid message",
                           user: FactoryGirl.create(:user),
                           idea: FactoryGirl.create(:aspect)
    )
    comment.should be_valid
  end

  it { should have_foreign_key_for(:users) }
  it { should have_foreign_key_for(:aspects) }
end