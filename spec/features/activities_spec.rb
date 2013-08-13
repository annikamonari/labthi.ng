require 'spec_helper'

feature 'Visitor checks activity stream' do

  before(:each) do
      submit_idea "import corn-free pringles from europe"
      update_idea
  end
  scenario 'for a recently created idea' do
    visit '/activities/index'
    expect(page).to have_content('created an idea import corn-free pringles from europe')
  end 
  scenario 'for a recently updated idea' do
    visit '/activities/index'
    expect(page).to have_content('updated an idea import corn-free pringles from europe')
  end
  scenario 'for a recently added aspect' do
    submit_aspect "Shipping considerations", "An efficient packing and shipping method should be considered"
    visit '/activities/index'
    expect(page).to have_content('added an aspect Shipping considerations')
  end
  scenario 'for a recently updated aspect' do
    submit_aspect "Shipping considerations", "An efficient packing and shipping method should be considered"
    click_link "Shipping considerations"
    click_link "Edit"
    click_button "Save Aspect"
    visit '/activities/index'
    expect(page).to have_content('updated an aspect Shipping considerations')
  end
  scenario 'for a recently added solution' do
    submit_aspect "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_solution "send by owl"
    visit '/activities/index'
    expect(page).to have_content('added a solution send by owl')
  end
  scenario 'for a recently added solution' do
    submit_aspect "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_solution "send by owl"
    submit_comment "this is an excellent idea"
    visit '/activities/index'
    expect(page).to have_content('added a comment this is an excellent idea')
  end
end