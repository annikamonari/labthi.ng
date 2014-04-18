require 'spec_helper'

feature 'Visitor submits a answer' do
  before(:each) do
    @idea_brief = 'Social network based on premise of only disliking posts'
    @question_title ='Target demographic'
    @question_brief = 'This social network should target a speific audience'
    @answer_brief = 'This product could target upper middle class males in NYC'
    submit_idea @idea_brief
    submit_question @question_title, @question_brief
    submit_answer @answer_brief
  end

  scenario 'with valid params', js: true do
    expect(page).to have_content(@idea_brief)
    expect(page).to have_content(@question_brief)
    expect(page).to have_content(@answer_brief)
  end

  scenario 'and sees it on the question page', js: true do
    expect(page).to have_content(@answer_brief)
  end

  scenario 'and automatically follows the idea' do
    page.should have_css ".unfollow-idea-button"
  end

end