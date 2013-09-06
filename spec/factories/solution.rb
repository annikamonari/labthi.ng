FactoryGirl.define do
  factory :solution do
    brief 		'Valid brief for a solution'
    user
    question
  end
end