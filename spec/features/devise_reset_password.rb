require 'spec_helper'

feature 'User forgets password and submits his email' do
 
  scenario "and follows the reset link" do
    user = FactoryGirl.create(:user)
    visit root_url
    click_link "Forgot your password?"
    fill_in "Email", :with => user.email
    click_button "Send me reset password instructions"
    current_path.should eq('/users/sign_in')
    page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
    last_email.to.should include(user.email)
    token = extract_token_from_email(:reset_password) 
    visit edit_user_password_url(reset_password_token: token)
    fill_in "user_password", :with => "annikamonari"
    fill_in "user_password_confirmation", :with => "annikamonari"
    click_button "Change my password"
    expect(page).to have_content("Your password was changed successfully. You are now signed in")
  end
end