require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
    @aspect = FactoryGirl.create(:aspect)
    @idea = FactoryGirl.create(:idea)
    @solution_before = FactoryGirl.create(:solution, idea: @idea, aspect: @aspect)
    @solution = FactoryGirl.create(:solution, idea: @idea, aspect: @aspect)
    @solution_after = FactoryGirl.create(:solution, idea: @idea, aspect: @aspect)
    @selector = ".solution-#{@solution.id}-vote-wrapper .vote-count"
  	sign_in
    visit idea_aspect_path(idea_id:@solution.idea.id, id: @aspect.id)
  end

  scenario 'in favor of a solution' do
  	find(@selector).should have_content("0")
  	click_link "vote-up-solution-#{@solution.id}"
  	find(@selector).should have_content("1")
    page.should have_selector("ul.solutions li:first-child #{@selector}", :text => "1")
  end
  scenario 'against a solution' do
  	find(@selector).should have_content("0")
  	click_link "vote-down-solution-#{@solution.id}"
  	find(@selector).should have_content("-1")
    page.should have_selector("ul.solutions li:last-child #{@selector}", :text => "-1")
  end
  scenario 'to undo an upvote on a solution' do
    click_link "vote-up-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    find(@selector).should have_content("0")
  end
  scenario 'to undo a dowvote on a solution' do
    click_link "vote-down-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    find(@selector).should have_content("0")
  end

end
