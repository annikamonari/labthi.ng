# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit '/users/sign_in'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_link 'Sign up'
    end

    def sign_in
      user = create(:user)
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end
