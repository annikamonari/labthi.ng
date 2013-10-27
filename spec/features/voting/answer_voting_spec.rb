require 'spec_helper'

feature 'Visitor votes' do
  before(:each) do
    @question = FactoryGirl.create(:question)
    @answer_before = FactoryGirl.create(:answer, question: @question)
  	@answer = FactoryGirl.create(:answer, question: @question)
    @answer_after = FactoryGirl.create(:answer, question: @question)
    @selector = ".answer-#{@answer.id}-vote-wrapper .vote-count"
  	sign_in
    visit url_for(@question)
  end

  scenario 'in favor of a answer' do
  	find(@selector).should have_content("1")
  	click_link "vote-up-answer-#{@answer.id}"
  	find(@selector).should have_content("2")
    page.should have_selector("ul.answers li:first-child #{@selector}", :text => "2")
  end
  scenario 'against a answer' do
  	page.should have_content("1")
  	click_link "vote-down-answer-#{@answer.id}"
  	find(@selector).should have_content("0")
    page.should have_selector("ul.answers li:last-child #{@selector}", :text => "0")
  end
  scenario 'to undo an upvote on a answer' do
    click_link "vote-up-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    find(@selector).should have_content("1")
  end
  scenario 'to undo a dowvote on a answer' do
    click_link "vote-down-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    find(@selector).should have_content("1")
  end
  scenario 'after signing out' do
    sign_out
    visit url_for(@question)
    find(@selector).should have_content("1")
    click_link "vote-up-answer-#{@answer.id}"
    find(@selector).should_not have_content("2")
    page.should_not have_selector("ul.answers li:first-child #{@selector}", :text => "2")
  end

end
