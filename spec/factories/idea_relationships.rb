# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea_relationship do
    follower_id 1
    followed_id 1
  end
end
