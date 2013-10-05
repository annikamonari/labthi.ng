require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'Example', 'User', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'Example', 'User', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', 'Example', 'User', ''

    expect(page).to have_content('Sign in')
  end

  scenario 'after logging in' do
    sign_up_with 'valid@example.com', 'Example', 'User', 'password'
    expect(page).to have_content('Welcome, Example')
    expect(page).to have_content('Sign out')
  end

  scenario 'and signs out' do
    sign_up_with 'valid@example.com', 'Example', 'User', 'password'
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end