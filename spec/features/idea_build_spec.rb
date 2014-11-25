require 'rails_helper'

feature 'User visits the build page' do
  before(:each) do
    FactoryGirl.create(:user, email: 'alan.vey@gmail.com')
    @admin = FactoryGirl.create(:user, admin: true)
    @user = FactoryGirl.create(:user, admin: false)
    sign_in @admin
    @part = FactoryGirl.create(:part)
    visit "/ideas/#{@part.idea.id}/build"
    click_button "Start"
  end

  scenario 'and finds a bootsy area to type in for plan and business plan parts, saves work when finished' do
    # Check for a class specific to bootsy
    links = ['Idea Description', 'Summary of Business', 'Summary of Product', 'Marketing Strategy Plan',
              'Market Analysis', 'Marketing Strategy Implementation', 'Executive Summary']
    links.each do |link|
      click_link link
      click_link 'Edit'
      page.html =~ /wysihtml5-toolbar/
      @part = FactoryGirl.create(:part, name: link)
      fill_in 'part_value', :with => 'some text'
      click_button "Save part"
      @part.value == 'some_text'
      visit "/ideas/#{@part.idea.id}/build"
    end
  end

  scenario 'and an admin but not a non admin user can click on any link they have not started' do
    expect(page).to have_selector(:link_or_button, 'Summary of Business')
    sign_out
    sign_in @user
    visit "/ideas/#{@part.idea.id}/build"
    expect(page).not_to have_selector(:link_or_button, 'Summary of Business')
    expect(page).to have_content('Summary of Business')
  end

  scenario 'and all parts are locked until idea description is done' do
    expect(page).to have_selector(:link_or_button, 'Locked', count: 11)
  end

  scenario 'and clicking start on a part changes status and button' do
    expect(page).to have_selector(:link_or_button, 'Finish')
    expect(page).to have_content('Started')
    @part.status == 'Started'
  end

  scenario 'and for another user the button of this part is disabled and started' do
    sign_out
    sign_in @user
    visit "/ideas/#{@part.idea.id}/build"
    expect(page).to have_selector(:link_or_button, 'Started')
  end

end