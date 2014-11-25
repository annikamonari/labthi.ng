require 'rails_helper'

feature 'Visitor votes' do
  before(:each) do
  	@question = FactoryGirl.create(:question)
    @comment_before = FactoryGirl.create(:comment, commentable: @question)
    @comment = FactoryGirl.create(:comment, commentable: @question)
    @comment_after = FactoryGirl.create(:comment, commentable: @question)
  	@selector = ".comment-#{@comment.id}-vote-wrapper .vote-count"
  	sign_in
    visit url_for(@question)
  end

  scenario 'in favor of an question comment' do
  	click_link "vote-up-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:first-child #{@selector}", :text => "2")
  end
  scenario 'against an question comment' do
  	click_link "vote-down-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:last-child #{@selector}", :text => "0")
  end
end
