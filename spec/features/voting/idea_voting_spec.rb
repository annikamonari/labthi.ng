require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@idea = FactoryGirl.create(:idea)
    @selector = ".idea-#{@idea.id}-vote-wrapper .vote-count"
  	sign_in
    visit url_for(@idea)
  end

  scenario 'in favor of an idea' do
  	find(@selector).should have_content("1")
  	click_link "vote-up-idea-#{@idea.id}"
  	find(@selector).should have_content("2")
  end
  scenario 'against an idea' do
  	find(@selector).should have_content("1")
  	click_link "vote-down-idea-#{@idea.id}"
  	find(@selector).should have_content("0")
  end
  scenario 'do undo an upvote' do
    click_link "vote-up-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    find(@selector).should have_content("1")
  end
  scenario 'do undo a downvote' do
    click_link "vote-down-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    find(@selector).should have_content("1")
  end

end