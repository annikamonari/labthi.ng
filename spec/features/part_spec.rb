require 'spec_helper'

feature 'User visits a parts page' do
  before(:each) do
    sign_in
    @part     = FactoryGirl.create(:part)
    @idea     = @part.component.idea_build.idea
    visit "/ideas/#{@idea.id}/parts/#{@part.id}/edit"
  end

  scenario 'and finds a bootsy area to type in' do
    # Check for a class specific to bootsy
    page.html =~ /wysihtml5-toolbar/
  end

  scenario 'and saves work once finished' do
    fill_in 'part_value', :with => 'some text'
    click_button "Save part"
    @part.value == 'some_text'
  end
end