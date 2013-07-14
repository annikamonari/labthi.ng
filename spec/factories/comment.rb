FactoryGirl.define do
  factory :comment do
    brief 		'Valid brief'
    user 		{ |c| c.association(:user) }
    solution 	{ |c| c.association(:solution) }
  end
end