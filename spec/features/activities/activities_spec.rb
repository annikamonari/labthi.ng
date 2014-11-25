require 'rails_helper'

feature 'Visitor checks activity stream' do

  before(:each) do
      @idea = FactoryGirl.create(:idea)
      submit_idea @idea.title, @idea.brief
  end
  scenario 'for a recently created idea' do
    visit '/activities/index'
    expect(page).to have_content(@idea.title)
  end 
  scenario 'for a recently updated idea' do
    if :user == @idea.user
      click_link 'Edit'
      fill_in 'Title', with: 'Greatest idea ever'
      click_button 'Update Idea'
      visit '/activities/index'
      expect(page).to have_content('Greatest idea ever')
    else
      visit '/activities/index'
      expect(page).to have_content(@idea.title)
    end
  end
  scenario 'for a recently added question' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    visit '/activities/index'
    expect(page).to have_content('added a question Shipping considerations')
  end
  scenario 'for a recently updated question' do
    @question = FactoryGirl.create(:question)
    submit_question @question.title, @question.brief
    if @question.user == @idea.user
      click_link "Edit"
      click_button "Create Question"
      visit '/activities/index'
      expect(page).to have_content('updated a question Shipping considerations')
    else
      visit '/activities/index'
      expect(page).to have_content("added a question #{@question.title}")
    end
  end
  scenario 'for a recently added answer' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_answer "send by owl"
    visit '/activities/index'
    expect(page).to have_content('added an answer send by owl')
  end
  scenario 'for a recently added comment' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_answer "send by owl"
    submit_comment "this is an excellent idea", '.answers'
    visit '/activities/index'
    expect(page).to have_content('added a comment this is an excellent idea')
  end
end