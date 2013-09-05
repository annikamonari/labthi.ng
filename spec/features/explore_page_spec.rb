require 'spec_helper'

feature 'User visits explore page' do
    before(:each) do
      visit '/'
      click_link 'Explore'
    end

  scenario 'and submits an idea' do
    click_link 'Submit Idea'
    fill_in 'Brief', with: 'valid brief'
    click_button 'Create Idea'
    update_idea
  end

  scenario 'and sees a listing of ideas' do
    brief = 'iPhone app that enables multitasking while beekeeping'
    idea = FactoryGirl.create(:idea, brief: brief)
    visit '/explore'
    expect(page).to have_content(brief)
  end

  scenario 'and filters ideas by category' do
    5.times { FactoryGirl.create(:idea, phase: '2') }
    5.times { FactoryGirl.create(:idea, phase: '3') }
    5.times { FactoryGirl.create(:idea, phase: '1') }
    click_link "Phase 1"
    expect(page).to have_content("Phase: 1")
    expect(page).to have_no_content("Phase: 2")
    click_link "Phase 2"
    expect(page).to have_content("Phase: 2")
    expect(page).to have_no_content("Phase: 3")
    click_link "Phase 3"
    expect(page).to have_content("Phase: 3")
    expect(page).to have_no_content("Phase: 1")
  end

end