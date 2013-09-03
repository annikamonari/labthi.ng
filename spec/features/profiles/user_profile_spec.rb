require 'spec_helper'

feature 'Visitor views profile page' do
	before(:each) do
    @user = sign_in
  	click_link @user.name
    click_link "Edit"
  end

  scenario 'for the first time' do
  	expect(page).to have_content(@user.name)
  	expect(page).to have_content('Profession')
  	expect(page).to have_content('About')
  	expect(page).to have_content('Age')
  	expect(page).to have_content('Country')
  	expect(page).to have_content('Website')
  end
  scenario 'and fills in required fields' do
  	fill_in 'Profession', with: 'Marketing Director'
  	click_button "Update Profile"
  	expect(page).to have_content "Successfully updated profile."
  	expect(page).to have_content "Marketing Director"
  end
  scenario 'after another user has created a profile' do
    sign_out
    @user2 = sign_in
    click_link @user2.name
    click_link 'Edit'
    fill_in 'Profession', with: 'Technology Director'
    click_button "Update Profile"
    expect(page).to have_content "Successfully updated profile."
    expect(page).to have_content "Technology Director"
    visit url_for(@user.profile)
    expect(page).to_not have_content "Technology Director"
  end
end