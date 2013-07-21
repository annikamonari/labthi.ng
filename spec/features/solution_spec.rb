require 'spec_helper'

feature 'Visitor submits a solution' do
=begin #This is a rough of some tests we may want in this spec
  scenario 'on an aspect with no solution' do 
    visit url_for(@aspect)
    expect(page).to have_content(@idea.title)
    expect(page).to have_content(@aspect.title)
    expect(page).to have_content("This aspect does not yet have a solution. Why don't you describe one?")
  end

  scenario 'that has a solution' do 
    submit_solution 'Target young adults in the United States'
    visit url_for(@aspect)
    expect(page).to have_no_content(@idea.brief)
    expect(page).to have_content(@idea.title)
    expect(page).to have_content(@aspect.title)
    expect(page).to have_content(@solution.brief)
  end
=end
end