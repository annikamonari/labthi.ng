require 'spec_helper'

feature 'Visitor views an idea' do
  scenario 'From home page' do
    @user = FactoryGirl.create(:user)
    @idea = FactoryGirl.create(
        :idea,
        :user_id => @user
    )
    @aspect = FactoryGirl.create(
        :aspect,
        :user_id => @user,
        :idea_id => @idea
    )


    visit url_for(@idea)
    expect(page).to have_content(@idea)
    expect(page).to have_content(@aspect)
    expect(page).to have_no_content("No aspects")
  end
end