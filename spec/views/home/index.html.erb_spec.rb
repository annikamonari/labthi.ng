require 'spec_helper'

feature 'User wants to submit a startup idea' do
  scenario 'From home page' do
    visit '/'
    expect(page).to have_content('What business needs to exist?')
    expect(page).to have_content('Brief')
    expect(page).to have_content('Industry')
    page.should have_no_content('Active')
    page.should have_no_content('Image')
    page.should have_no_content('Phase')
    submit_idea 'valid', 'valid'
  end
  scenario 'From submit page' do
    visit '/ideas/new'
    expect(page).to have_content('What business needs to exist?')
    expect(page).to have_content('Brief')
    expect(page).to have_content('Industry')
    page.should have_no_content('Active')
    page.should have_no_content('Image')
    page.should have_no_content('Phase')
  end
end

feature 'User submits a startup idea' do
  scenario 'with valid input' do
    valid_brief = 'Social network based on premise of only disliking posts'
    industry = 'Social Media'
    submit_idea valid_brief, industry
    page.should have_content "Great! Now let's expand on that a little."
    page.should have_content valid_brief
    page.should have_content industry
  end

  scenario 'without industry' do
    submit_idea 'awesome idea here', ''
    page.should have_button 'Create Idea'
  end

  scenario 'without idea' do
    submit_idea '', 'Banking'
    page.should have_button 'Create Idea'
  end

=begin
  def sign_in
    user = create(:user)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
=end

end

def submit_idea(brief, industry, path = '/ideas/new')
  visit path
  fill_in 'Brief', with: brief
  fill_in 'Industry', with: industry
  click_button 'Create Idea'
end
