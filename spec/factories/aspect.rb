FactoryGirl.define do
  factory :aspect do
    title 'Valid title'
    brief 'Valid brief'
    idea { |c| c.association(:idea) }
    user { |c| c.association(:user) }
  end
end