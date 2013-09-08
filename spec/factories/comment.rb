FactoryGirl.define do
  factory :comment do
    brief 		'Valid brief'
    user
	association :commentable, :factory => :solution
  end
end