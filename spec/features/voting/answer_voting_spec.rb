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
  	find(@selector).should have_content("0")
  	click_link "vote-up-answer-#{@answer.id}"
  	find(@selector).should have_content("1")
    page.should have_selector("ul.answers li:first-child #{@selector}", :text => "1")
  end
  scenario 'against a answer' do
  	page.should have_content("0")
  	click_link "vote-down-answer-#{@answer.id}"
  	find(@selector).should have_content("-1")
    page.should have_selector("ul.answers li:last-child #{@selector}", :text => "-1")
  end
  scenario 'to undo an upvote on a answer' do
    click_link "vote-up-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    find(@selector).should have_content("0")
  end
  scenario 'to undo a dowvote on a answer' do
    click_link "vote-down-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    find(@selector).should have_content("0")
  end

end
