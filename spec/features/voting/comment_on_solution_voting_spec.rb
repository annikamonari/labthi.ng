require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@aspect = FactoryGirl.create(:aspect)
  	@solution = FactoryGirl.create(:solution, aspect: @aspect)
    @comment_before = FactoryGirl.create(:comment, commentable: @solution)
    @comment = FactoryGirl.create(:comment, commentable: @solution)
    @comment_after = FactoryGirl.create(:comment, commentable: @solution)
  	@selector = ".comment-#{@comment.id}-vote-wrapper"
  	sign_in
    visit idea_aspect_path(idea_id:@solution.idea.id, id: @aspect.id)
  end

  scenario 'in favor of an solution comment' do
  	click_link "vote-up-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:first-child #{@selector}", :text => "Votes: 1")
  end
  scenario 'against an solution comment' do
  	click_link "vote-down-comment-#{@comment.id}"
    page.should have_selector("ul.comments li:last-child #{@selector}", :text => "Votes: -1")
  end
end
