require 'spec_helper'

feature 'Visitor submits a question' do
    before(:each) do
        @idea = FactoryGirl.create(:idea)
        visit url_for(@idea)
    end

  scenario 'with valid params' do
    click_link 'Create a question'
    fill_in 'Title', with: 'Valid question title'
    fill_in 'Description', with: 'This is valid description for the question.'
    fill_in 'Answers expected', with: '2'
    click_button 'Create Question'
    expect(page).to have_content('Question was successfully created.')
  end

  scenario 'and views it on the idea page' do
    question = 'How could this product be manufactured?'
    brief = 'Lorem ipsum dolor sit amet.'
    submit_question 
    visit url_for(@idea)
    expect(page).to have_content(question)
  end

end