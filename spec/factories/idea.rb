FactoryGirl.define do
  factory :idea do
    brief 'Valid brief for an idea'
    phase 1
    active true
    user
  end
end