FactoryGirl.define do
  factory :aspect do
    title 'Valid title'
    brief 'Valid brief'
    idea_id { |c| c.association(:idea) }
    user_id { |c| c.association(:user) }
  end
end