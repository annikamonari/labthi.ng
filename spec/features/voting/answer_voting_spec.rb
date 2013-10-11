require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
  	@answer = FactoryGirl.create(:answer)
  	sign_in
    visit url_for(@answer.question)
  end

  scenario 'in favor of a answer' do
  	page.should have_content("Votes: 0")
  	click_link "vote-up-answer-#{@answer.id}"
  	page.should have_content("Votes: 1")
  end
  scenario 'against a answer' do
  	page.should have_content("Votes: 0")
  	click_link "vote-down-answer-#{@answer.id}"
  	page.should have_content("Votes: -1")
  end
  scenario 'to undo an upvote on a answer' do
    click_link "vote-up-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    page.should have_content("Votes: 0")
  end
  scenario 'to undo a dowvote on a answer' do
    click_link "vote-down-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    page.should have_content("Votes: 0")
  end

end
