require 'spec_helper'

feature 'View a page with the navbar' do
    before(:each) do
    	@user = sign_in
    	visit '/'
    end

  scenario 'and sign out' do
  	click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'click name to visit profile' do
  	click_link @user.name
  	click_link 'Edit'
  	fill_in 'Profession', with: 'Astronomer'
  	click_button 'Update Profile'
    expect(page).to have_content('Profession: ' + @user.profile.profession)
  end

  scenario 'navigate to explore page' do
  	click_link @user.name
  	click_link "Labthi.ng"
  	current_path.should == '/'
  end

  scenario 'navigate to explore page' do
  	click_link "Explore"
  	current_path.should == '/explore'
  end

end