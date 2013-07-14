FactoryGirl.define do
  factory :solution do
    brief 		'Valid brief for a solution'
    user 	{ |c| c.association(:user) }
    aspect 	{ |c| c.association(:aspect) }
  end
end