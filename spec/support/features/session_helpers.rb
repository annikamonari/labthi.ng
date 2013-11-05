# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(email, first_name, last_name, password)
      visit '/register'
      fill_in 'Email', with: email
      fill_in 'First Name', with: first_name
      fill_in 'Last Name', with: last_name
      fill_in 'Password', with: password
      click_button 'Register'
    end

    def sign_in()
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

    def submit_idea(title = 'valid title', brief = 'valid brief', path = '/ideas/new')
      sign_in
      visit path
      fill_in 'Title', with: title
      fill_in 'Brief', with: brief
      check 'Website'
      select 'Science & Technology', :from => 'idea_category_list'
      click_button 'Create Idea'
      # Insert information to test updates here
    end
    
    def update_aspect(title, brief)
      click_link 'Add aspect'
      fill_in 'aspect_title', with: title
      fill_in 'aspect_brief', with: brief
      click_button 'Create Aspect'
    end
    # This must be called from a question page
    def submit_answer(brief)
      click_link 'Add answer'
      fill_in 'Brief', with: brief
      click_button 'Create Answer'
    end
    # This must be called from the desired page
    def submit_comment(brief, selector='html', add_comment_link = 'Add comment')
      find(selector).click_link add_comment_link
      fill_in 'Brief', with: brief
      click_button 'Create Comment'
    end

    # This must be called from an idea page
    def submit_question(title = 'valid title', brief = 'valid brief', answers_expected = '2')
      click_link 'Create a question'
      fill_in 'Question', with: title
      fill_in 'Description', with: brief
      fill_in 'Answers expected', with: answers_expected
      click_button 'Create Question'
    end
    def submit_solution(brief = 'valid title')
      click_link 'Add solution'
      fill_in "Brief", with: brief
      click_button "Create Solution"
    end
  end
end
