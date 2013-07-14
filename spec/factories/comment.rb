FactoryGirl.define do
  factory :comment do
    brief 		'Valid brief'
    user
    solution
  end
end