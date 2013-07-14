FactoryGirl.define do
  factory :idea do
    brief 'Valid brief for an idea'
    phase 1
    active true
    industry 'Technology'
    user
  end
end