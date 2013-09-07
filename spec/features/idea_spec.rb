require 'spec_helper'

feature 'User wants to submit a startup idea' do
  scenario 'From submit page' do
    sign_in
    visit '/ideas/new'
    expect(page).to have_content('What business needs to exist?')
  end
  scenario 'with valid input' do
    valid_brief = 'Social network based on premise of only disliking posts'
    submit_idea valid_brief
    page.should have_content "Great! Now let's expand on that a little."
    page.should have_content valid_brief
  end
  scenario 'without idea' do
    submit_idea ''
    page.should have_button 'Create Idea'
  end
  scenario 'and view its page' do
    submit_idea 'best idea ever'
    page.should have_content 'best idea ever'
  end
end