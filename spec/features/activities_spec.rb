require 'spec_helper'

feature 'Visitor updates' do

  scenario 'an idea and exptects it in the activity stream' do
        submit_idea "import corn-free pringles from europe"
        update_idea
        visit '/activities/index'
        expect(page).to have_content('updated an idea import corn-free pringles from europe')
  end
  scenario 'an aspect and exptects it in the activity stream' do
        submit_idea "import corn-free pringles from europe"
        update_idea
        submit_aspect "Shipping considerations", "An efficient packing and shipping method should be considered"
        visit '/activities/index'
        expect(page).to have_content('added an aspect Shipping considerations')
  end
end