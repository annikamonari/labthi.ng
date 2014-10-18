require 'spec_helper'

feature 'Visitor checks activity stream' do

  before(:each) do
    @idea = FactoryGirl.create(:idea)
    submit_idea @idea.title, @idea.brief
  end
  scenario 'for a recently created idea'

end