require 'spec_helper'

feature 'Visitor submits a question' do
    before(:each) do
      sign_in
      @idea = FactoryGirl.create(:idea)
      visit url_for(@idea)
    end

  scenario 'with valid params' do
    click_link 'Create a question'
    fill_in 'Question', with: 'Valid question'
    fill_in 'Description', with: 'This is valid description for the question.'
    fill_in 'Answers expected', with: '2'
    click_button 'Create Question'
    expect(page).to have_content('Question was successfully created.')
  end

  scenario 'and views it on the idea page' do
    question = 'How could this product be manufactured?'
    brief = 'Lorem ipsum dolor sit amet.'
    submit_question question, brief
    visit url_for(@idea)
    expect(page).to have_content(question)
  end
  scenario 'and views it' do
    question = 'Why should this product be manufactured?'
    brief = 'Lorem ipsum dolor sit amet!!!'
    submit_question question, brief
    visit url_for(@idea)
    click_link(question)
    expect(page).to have_content(brief)
  end

end