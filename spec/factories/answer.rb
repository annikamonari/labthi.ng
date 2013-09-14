FactoryGirl.define do
  factory :answer do
    brief 		'Valid brief for a answer'
    user
    question
  end
end