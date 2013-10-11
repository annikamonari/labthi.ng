require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@solution = FactoryGirl.create(:solution)
  	sign_in
    visit idea_aspect_path(idea_id:@solution.idea.id, id: @solution.aspect.id)
  end

  scenario 'in favor of a solution' do
  	page.should have_content("Votes: 0")
  	click_link "vote-up-solution-#{@solution.id}"
  	page.should have_content("Votes: 1")
  end
  scenario 'against a solution' do
  	page.should have_content("Votes: 0")
  	click_link "vote-down-solution-#{@solution.id}"
  	page.should have_content("Votes: -1")
  end
  scenario 'to undo an upvote on a solution' do
    click_link "vote-up-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    page.should have_content("Votes: 0")
  end
  scenario 'to undo a dowvote on a solution' do
    click_link "vote-down-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    page.should have_content("Votes: 0")
  end

end
