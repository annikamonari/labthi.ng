require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@solution = FactoryGirl.create(:solution)
    @selector = ".solution-#{@solution.id}-vote-wrapper"
  	sign_in
    visit idea_aspect_path(idea_id:@solution.idea.id, id: @solution.aspect.id)
  end

  scenario 'in favor of a solution' do
  	find(@selector).should have_content("Votes: 0")
  	click_link "vote-up-solution-#{@solution.id}"
  	find(@selector).should have_content("Votes: 1")
  end
  scenario 'against a solution' do
  	find(@selector).should have_content("Votes: 0")
  	click_link "vote-down-solution-#{@solution.id}"
  	find(@selector).should have_content("Votes: -1")
  end
  scenario 'to undo an upvote on a solution' do
    click_link "vote-up-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    find(@selector).should have_content("Votes: 0")
  end
  scenario 'to undo a dowvote on a solution' do
    click_link "vote-down-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    find(@selector).should have_content("Votes: 0")
  end

end
