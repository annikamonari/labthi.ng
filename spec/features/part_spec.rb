require 'spec_helper'

feature 'User visits the build page' do
  before(:each) do
    sign_in
    @part = FactoryGirl.create(:part)
    @idea = @part.component.idea_build.idea
    visit "/ideas/#{@idea.id}/build"
  end

  scenario 'and finds a bootsy area to type in' do
    # Check for a class specific to bootsy
    click_link 'Idea Scope Summary'
    page.html =~ /wysihtml5-toolbar/
  end

  scenario 'and saves work once finished' do
    click_link 'Idea Scope Summary'
    fill_in 'part_value', :with => 'some text'
    click_button "Save part"
    @part.value == 'some_text'
  end

  scenario 'and click start on a part' do
    click_button 'Start'
    expect(page).should have_content('Finish')
    expect(page).should have_content('Started')
  end
end