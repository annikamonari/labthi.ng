require 'spec_helper'

describe Answer do
	  it "should destroy associated comment" do
    answer = FactoryGirl.create(:answer)
    comment = FactoryGirl.create(:comment, :commentable => answer)
    expect {
        answer.destroy
      }.to change(Comment, :count).by(-1)
  end
end
