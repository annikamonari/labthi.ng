require 'spec_helper'

feature 'Visitor checks activity stream' do

  before(:each) do
      submit_idea "import corn-free pringles from europe"
  end
  scenario 'for a recently created idea' do
    visit '/activities/index'
    expect(page).to have_content('created an idea import corn-free pringles from europe')
  end 
  scenario 'for a recently updated idea' do
    click_link 'Edit'
    click_button 'Update Idea'
    visit '/activities/index'
    expect(page).to have_content('updated an idea import corn-free pringles from europe')
  end
  scenario 'for a recently added question' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    visit '/activities/index'
    expect(page).to have_content('added a question Shipping considerations')
  end
  scenario 'for a recently updated question' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    click_link "Shipping considerations"
    click_link "Edit"
    click_button "Create Question"
    visit '/activities/index'
    expect(page).to have_content('updated a question Shipping considerations')
  end
  scenario 'for a recently added solution' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_solution "send by owl"
    visit '/activities/index'
    expect(page).to have_content('added a solution send by owl')
  end
  scenario 'for a recently added solution' do
    submit_question "Shipping considerations", "An efficient packing and shipping method should be considered"
    submit_solution "send by owl"
    submit_comment "this is an excellent idea"
    visit '/activities/index'
    expect(page).to have_content('added a comment this is an excellent idea')
  end
end