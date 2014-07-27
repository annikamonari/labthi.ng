require 'spec_helper'
feature 'Visitor votes' do
  before(:each) do
  	@idea = FactoryGirl.create(:idea)
  	sign_in
    visit url_for(@idea)
  end

  scenario 'in favor of an idea' do
  	check_idea_rep(@idea,10)
  	click_link "vote-up-idea-#{@idea.id}"
    check_idea_rep(@idea,20)
  end
  scenario 'against an idea' do
    check_idea_rep(@idea,10)
  	click_link "vote-down-idea-#{@idea.id}"
    check_idea_rep(@idea,0)
  end
  scenario 'to undo an upvote' do
    click_link "vote-up-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    check_idea_rep(@idea,1)
  end
  scenario 'to undo a downvote' do
    click_link "vote-down-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    check_idea_rep(@idea,1)
  end
end