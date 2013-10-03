require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@idea = FactoryGirl.create(:idea)
  	sign_in
  end

  scenario 'in favor of an idea' do
  	visit url_for(@idea)
  	page.should have_content("Votes: 0")
  	click_link 'vote-up'
  	page.should have_content("Votes: 1")
  end
  scenario 'against an idea' do
  	visit url_for(@idea)
  	page.should have_content("Votes: 0")
  	click_link 'vote-down'
  	page.should have_content("Votes: -1")
  end
  scenario 'do undo an upvote' do
    visit url_for(@idea)
    click_link 'vote-up'
    click_link 'vote-undo'
    page.should have_content("Votes: 0")
  end
  scenario 'do undo a downvote' do
    visit url_for(@idea)
    click_link 'vote-down'
    click_link 'vote-undo'
    page.should have_content("Votes: 0")
  end

end