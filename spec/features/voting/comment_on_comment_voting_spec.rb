require 'rails_helper'

feature 'Visitor votes' do
  before(:each) do
  	@answer = FactoryGirl.create(:answer)
  	@parent_before = FactoryGirl.create(:comment, commentable: @answer)
  	@parent = FactoryGirl.create(:comment, commentable: @answer)
  	@parent_after = FactoryGirl.create(:comment, commentable: @answer)
    @comment_before = FactoryGirl.create(:comment, commentable: @parent)
    @comment = FactoryGirl.create(:comment, commentable: @parent)
    @comment_after = FactoryGirl.create(:comment, commentable: @parent)
  	@selector = ".comment-#{@comment.id}-vote-wrapper .vote-count"
  	sign_in
    visit url_for(@answer.question)
  end

  scenario 'in favor of a comment comment' do
  	click_link "vote-up-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:first-child #{@selector}", :text => "2")
  end
  scenario 'against a comment comment' do
  	click_link "vote-down-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:last-child #{@selector}", :text => "0")
  end
end
