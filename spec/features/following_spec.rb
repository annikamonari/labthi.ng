require 'spec_helper'

feature 'User can', js: true do

  before(:each)  do
    @user = sign_in
    @idea = FactoryGirl.create(:idea)
    visit "/ideas/#{@idea.id}"
    page.find('.follow-idea-button').click
  end
  scenario 'follow an idea' do
    page.should have_css ".unfollow-idea-button"
  end

  scenario 'unfollow an idea' do
    page.find('.unfollow-idea-button').click
    page.should have_css ".follow-idea-button"
  end

  scenario 'see followers on reputation overview page' do
    click_link "Reputation"
    find(".idea-followers").should have_content @user.name
  end

  scenario 'see followed ideas on dashboard' do
    visit '/'
    find(".followed-ideas").should have_content @idea.title
  end

  scenario 'unfollow from the dashboard' do
    page.find(".primary-logo").click
    page.find(".unfollow-idea-#{@idea.id}").click
    page.should have_selector ".follow-idea-#{@idea.id}"
  end

  scenario 'see followed ideas on user profile' do
    click_link(@user.name, :match => :first)
    click_on "Labs"
    find(".followed-ideas").should have_content @idea.title
  end

  scenario 'unfollow from own user profile' do
    click_link(@user.name, :match => :first)
    click_on "Labs"
    page.find(".unfollow-idea-#{@idea.id}").click
    page.should have_selector ".follow-idea-#{@idea.id}"
  end
end
