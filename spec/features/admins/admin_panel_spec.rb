require 'spec_helper'

feature 'Admin can sign in' do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      visit '/admins/sign_in'
      fill_in 'Email', with: @admin.email
      fill_in 'Password', with: @admin.password
      click_button 'Sign in'
    end

    scenario '' do
    end
end
