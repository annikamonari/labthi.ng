require 'spec_helper'

feature 'User visits the edit path for a idea build part' do

  before(:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @user  = FactoryGirl.create(:user, admin: false)
    @part  = FactoryGirl.create(:part)

    sign_in @admin
    visit "/ideas/#{@part.idea.id}/parts/#{@part.id}/edit"

    click_link 'New Admin task'
    fill_in 'Title', with: 'Admin Task' 
    fill_in 'Description', with: 'This is a test'
    click_button 'Create Admin task'
  end

  scenario 'and adds a task and comments on it' do
    click_link 'Comment'
    fill_in 'Comment', with: 'Test comment'
    click_button 'Create Task comment'


    expect(page).to have_content('Test comment')
    expect(page).to have_content('Admin Task')
    expect(page).to have_selector(:link_or_button, 'Start')
  end

  scenario 'and starts a task' do
    sign_out
    sign_in @user
    visit "/ideas/#{@part.idea.id}/parts/#{@part.id}/edit"
    
    click_button 'Start'
    click_button 'Finish'

    expect(page).to have_css(".disabled")
  end

  scenario 'and cannot review a task unless they are an admin' do
    sign_out
    sign_in @user
    visit "/ideas/#{@part.idea.id}/parts/#{@part.id}/edit"
    
    click_button 'Start'
    click_button 'Finish'

    sign_out
    sign_in @admin
    visit "/ideas/#{@part.idea.id}/parts/#{@part.id}/edit"

    expect(page).to_not have_css(".disabled")
    expect(page).to have_selector(:link_or_button, 'Review')
  end

end
