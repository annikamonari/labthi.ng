FactoryGirl.define do
  factory :aspect do
    title 'Valid aspect title'
    brief 'Valid brief for an aspect'
    idea { |c| c.association(:idea) }
    user { |c| c.association(:user) }
  end
end