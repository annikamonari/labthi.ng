FactoryGirl.define do
  factory :idea do
  	title 'Valid Title'
    brief 'Valid brief for an idea'
    phase 1
    active true
    category_list 'Other'
    component_list 'App'
    create_days Date.today + 10.days
    user
  end
end