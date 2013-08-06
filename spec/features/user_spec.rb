require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'Example User', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'Example User', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', 'Example user', ''

    expect(page).to have_content('Sign in')
  end

  scenario 'after logging in' do
    sign_up_with 'valid@example.com', 'Example user', 'password'
    expect(page).to have_content('Welcome, valid@example.com')
    expect(page).to have_content('Sign out')
  end

  scenario 'and views profile page' do
    sign_up_with 'valid@example.com', 'Example User', 'password'
    click_link 'Profile'
    expect(page).to have_content('Example User')
  end

  scenario 'and signs out' do
    sign_up_with 'valid@example.com', 'Example User', 'password'
    click_link 'Sign out'
    expect(page).to have_content('Signed out')
  end
end