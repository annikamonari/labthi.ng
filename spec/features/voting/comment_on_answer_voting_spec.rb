require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@answer = FactoryGirl.create(:answer)
  	@comment = FactoryGirl.create(:comment, commentable: @answer)
  	sign_in
    visit url_for(@answer.question)
  end

  scenario 'in favor of an answer comment' do
  	page.should have_content("Votes: 0")
  	click_link "vote-up-comment-#{@comment.id}"
  	page.should have_content("Votes: 1")
  end
  scenario 'against an answer comment' do
  	page.should have_content("Votes: 0")
  	click_link "vote-down-comment-#{@comment.id}"
  	page.should have_content("Votes: -1")
  end
  scenario 'to undo an upvote on an answer comment' do
    click_link "vote-up-comment-#{@comment.id}"
    click_link "vote-undo-comment-#{@comment.id}"
    page.should have_content("Votes: 0")
  end
  scenario 'to undo a dowvote on an answer comment' do
    click_link "vote-down-comment-#{@comment.id}"
    click_link "vote-undo-comment-#{@comment.id}"
    page.should have_content("Votes: 0")
  end

end
