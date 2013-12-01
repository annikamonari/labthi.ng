require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
    @question_before = FactoryGirl.create(:question)
    @question = FactoryGirl.create(:question)
    @question_after = FactoryGirl.create(:question)
    @selector = ".question-#{@question.id}-vote-wrapper .vote-count"
  	sign_in
    visit url_for(@question.idea)
  end

  scenario 'in favor of a question' do
  	find(@selector).should have_content("1")
  	click_link "vote-up-question-#{@question.id}"
  	find(@selector).should have_content("2")
    page.should have_selector("ul.questions li:first-child #{@selector}", :text => "2")
  end
  scenario 'against a question' do
  	find(@selector).should have_content("1")
  	click_link "vote-down-question-#{@question.id}"
  	find(@selector).should have_content("0")
    page.should have_selector("ul.questions li:last-child #{@selector}", :text => "0")
  end
=begin
  scenario 'to undo an upvote on a question' do
    click_link "vote-up-question-#{@question.id}"
    click_link "vote-undo-question-#{@question.id}"
    find(@selector).should have_content("1")
  end
  scenario 'to undo a dowvote on a question' do
    click_link "vote-down-question-#{@question.id}"
    click_link "vote-undo-question-#{@question.id}"
    find(@selector).should have_content("1")
  end
=end
end
