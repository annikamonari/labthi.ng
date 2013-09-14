FactoryGirl.define do
  factory :comment do
    brief 		'Valid brief'
    user
	association :commentable, :factory => :answer
  end
end