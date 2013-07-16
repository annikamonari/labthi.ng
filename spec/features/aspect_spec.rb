require 'spec_helper'

feature 'Visitor views an aspect' do
    before(:each) do
        @user = FactoryGirl.create(:user)
        @idea = FactoryGirl.create(
            :idea,
            :user => @user
        )
        @aspect = FactoryGirl.create(
            :aspect,
            :user => @user,
            :idea => @idea
        )
    end
  scenario 'on its idea page' do 
    visit url_for(@aspect.idea)
    expect(page).to have_content(@idea.brief)
    expect(page).to have_content(@aspect.title)
    expect(page).to have_no_content("No aspects")
  end
  scenario 'that has no solution' do 
    visit url_for(@aspect)
    expect(page).to have_no_content(@idea.brief)
    expect(page).to have_content(@idea.title)
    expect(page).to have_content(@aspect.title)
    expect(page).to have_content("This aspect does not yet have a solution. Why don't you describe one?")
  end

  scenario 'that has a solution' do 
    @solution = FactoryGirl.create(
        :solution,
        :aspect => @aspect,
        :user => @user
        )
    visit url_for(@aspect)
    expect(page).to have_no_content(@idea.brief)
    expect(page).to have_content(@idea.title)
    expect(page).to have_content(@aspect.title)
    expect(page).to have_content(@solution.brief)
  end

end
