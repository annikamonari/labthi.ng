require 'spec_helper'

feature 'Visitor checks activity stream' do

  before(:each) do
    @admin = FactoryGirl.create(:user, email: 'alan.vey@gmail.com', admin: true)
    @user  = FactoryGirl.create(:user, admin: false)
    @idea  = FactoryGirl.create(:idea)
    submit_idea @idea.title, @idea.brief
    @idea.promote!
    sign_out
    sign_in @user
    visit "/ideas/#{@idea.id}/build"
  end
  scenario 'for profile and idea after starting a part' do
    click_button 'Start'

    visit "/ideas/#{@idea.id}/activity"
    expect(page).to have_content('started a part')

    visit "/ideas/#{@idea.id}/reputation"
    expect(page).to have_content('Points: 10')

    visit "/profiles/#{@user.profile.id}"
    expect(page).to have_content('started a part')

    visit "/"
    expect(page).to have_content('started a part')
  end

  scenario 'for profile and idea after starting an admin task' do
    sign_out
    sign_in @admin
    visit "/ideas/#{@idea.id}/build"
    click_button 'Start'
    click_button 'Finish'
    click_button 'Review'
    click_link 'Idea Description'
    click_link 'New Admin task'
    fill_in 'Title', with: '123'
    fill_in 'Description', with: '123'
    click_button 'Create Admin task'
    click_button 'Start'

    visit "/ideas/#{@idea.id}/activity"
    expect(page).to_not have_content('started an admin task')

    visit "/ideas/#{@idea.id}/reputation"
    expect(page).to have_content('Points: 11')

    visit "/profiles/#{@admin.profile.id}"
    expect(page).to have_content('started an admin task')

    visit "/"
    expect(page).to have_content('started an admin task')
  end

  scenario 'for profile and idea after adding a question' do
    visit "/ideas/#{@idea.id}"
    submit_question

    visit "/ideas/#{@idea.id}/activity"
    expect(page).to have_content('added a question')

    visit "/ideas/#{@idea.id}/reputation"
    expect(page).to have_content('Points: 2')

    visit "/profiles/#{@user.profile.id}"
    expect(page).to have_content('added a question')

    visit "/"
    expect(page).to have_content('added a question')
  end
end