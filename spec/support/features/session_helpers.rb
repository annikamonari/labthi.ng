# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(email, name, password)
      visit '/register'
      fill_in 'Email', with: email
      fill_in 'Name', with: name
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
      return user
    end

    def sign_out
      click_link 'Sign out'
    end

    def submit_idea(brief = 'valid brief', industry = 'valid industry', path = '/ideas/new')
      sign_in
      visit path
      fill_in 'Brief', with: brief
      fill_in 'Industry', with: industry
      click_button 'Create Idea'
      # Insert information to test updates here
    end

    def update_idea()
      select 'Science & Technology', :from => 'idea_category_list'
      click_button 'Update Idea'
    end

    # This must be called from an idea page
    def submit_aspect(title, brief)
      click_link 'Add aspect'
      fill_in 'aspect_title', with: title
      fill_in 'aspect_brief', with: brief
      click_button 'Save Aspect'
    end
    # This must be called from an idea page
    def update_aspect(title, brief)
      click_link 'Add aspect'
      fill_in 'aspect_title', with: title
      fill_in 'aspect_brief', with: brief
      click_button 'Create Aspect'
    end
    # This must be called from an idea page
    def submit_solution(brief)
      click_link 'Add solution'
      fill_in 'Brief', with: brief
      click_button 'Create Solution'
    end
    # This must be called from an idea page
    def submit_comment(brief)
      click_link 'Add comment'
      fill_in 'Brief', with: brief
      click_button 'Create Comment'
    end
  end
end
