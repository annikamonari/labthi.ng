require 'spec_helper'

describe Solution do
	  it "should destroy associated comment" do
    solution = FactoryGirl.create(:solution)
    comment = FactoryGirl.create(:comment, :solution => solution)
    expect {
        solution.destroy
      }.to change(Comment, :count).by(-1)
  end
end
