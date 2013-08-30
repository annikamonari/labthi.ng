require 'spec_helper'

feature 'User wants to submit a startup idea' do
  scenario 'From home page' do
    visit '/'
    expect(page).to have_content('What business needs to exist?')
    expect(page).to have_content('Brief')
    page.should have_no_content('Active')
    page.should have_no_content('Image')
    page.should have_no_content('Phase')
    submit_idea 'valid', '/'
  end
  scenario 'From submit page' do
    visit '/ideas/new'
    expect(page).to have_content('What business needs to exist?')
    expect(page).to have_content('Brief')
    page.should have_no_content('Active')
    page.should have_no_content('Image')
    page.should have_no_content('Phase')
  end
  scenario 'with valid input' do
    valid_brief = 'Social network based on premise of only disliking posts'
    submit_idea valid_brief
    page.should have_content "Great! Now let's expand on that a little."
    page.should have_content valid_brief
    find_field('Brief').value.should eq valid_brief
  end
  scenario 'without idea' do
    submit_idea ''
    page.should have_button 'Create Idea'
  end
  scenario 'and view its page' do
    submit_idea 'best idea ever'
    update_idea
    page.should have_content 'best idea ever'
  end
end