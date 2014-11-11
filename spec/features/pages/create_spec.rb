require 'spec_helper'

feature 'User visits create page' do
    before(:each) do
      visit '/'
      click_link 'Create'
    end

  scenario 'and submits an idea' do
    sign_in
    click_link 'Create'
    click_link 'Submit Idea'
    expect(page).to have_content 'What business needs to exist?'
  end

  scenario 'and sees a listing of ideas' do
    brief = 'iPhone app that enables multitasking while beekeeping'
    idea = FactoryGirl.create(:idea, brief: brief)
    visit '/create'
    expect(page).to have_content(brief)
  end

  scenario 'and filters ideas by category' do
    FactoryGirl.create(:idea, category_list: 'Other')
    FactoryGirl.create(:idea, category_list: 'Science & Technology')
    FactoryGirl.create(:idea, category_list: 'Retail')
    click_link "Other"
    puts page.html
    page.should have_selector(".idea-categories", :text => "Other")
    page.should have_no_selector(".idea-categories", :text => "Retail")
    click_link "Retail"
    page.should have_selector(".idea-categories", :text => "Retail")
    page.should have_no_selector(".idea-categories", :text => "Other")
    click_link "Science & Technology"
    page.should have_selector(".idea-categories", :text => "Science & Technology")
    page.should have_no_selector(".idea-categories", :text => "Retail")
  end

end