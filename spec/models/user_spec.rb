require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end
  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password

    click_button 'Sign up'
  end

  def sign_in
    user = create(:user)
    visit sign_in_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end