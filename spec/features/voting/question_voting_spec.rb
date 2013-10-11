require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@question = FactoryGirl.create(:question)
    @selector = ".question-#{@question.id}-vote-wrapper"
  	sign_in
    visit url_for(@question.idea)
  end

  scenario 'in favor of a question' do
  	find(@selector).should have_content("Votes: 0")
  	click_link "vote-up-question-#{@question.id}"
  	find(@selector).should have_content("Votes: 1")
  end
  scenario 'against a question' do
  	find(@selector).should have_content("Votes: 0")
  	click_link "vote-down-question-#{@question.id}"
  	find(@selector).should have_content("Votes: -1")
  end
  scenario 'to undo an upvote on a question' do
    click_link "vote-up-question-#{@question.id}"
    click_link "vote-undo-question-#{@question.id}"
    find(@selector).should have_content("Votes: 0")
  end
  scenario 'to undo a dowvote on a question' do
    click_link "vote-down-question-#{@question.id}"
    click_link "vote-undo-question-#{@question.id}"
    find(@selector).should have_content("Votes: 0")
  end

end
