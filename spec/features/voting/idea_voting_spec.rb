require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@idea = FactoryGirl.create(:idea)
  	sign_in
    visit url_for(@idea)
  end

  scenario 'in favor of an idea' do
  	page.should have_content("Votes: 0")
  	click_link "vote-up-idea-#{@idea.id}"
  	page.should have_content("Votes: 1")
  end
  scenario 'against an idea' do
  	page.should have_content("Votes: 0")
  	click_link "vote-down-idea-#{@idea.id}"
  	page.should have_content("Votes: -1")
  end
  scenario 'do undo an upvote' do
    click_link "vote-up-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    page.should have_content("Votes: 0")
  end
  scenario 'do undo a downvote' do
    click_link "vote-down-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    page.should have_content("Votes: 0")
  end

end