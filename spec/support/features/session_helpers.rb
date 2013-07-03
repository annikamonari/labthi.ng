# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit '/register'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Register'
    end

    def sign_in
      user = create(:user)
      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end
