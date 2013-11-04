require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  end

  scenario 'submiting an idea' do
    submit_idea
    find('.show-user-profile a').click
    find(".rep-points").should have_content '10'
  end
end
