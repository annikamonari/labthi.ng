FactoryGirl.define do


  factory :user do
    sequence(:email) {
      |n| time = Time.new
      "person#{time.usec}@example.com"
    }
    password               '12345678'
    password_confirmation  '12345678'
=begin
    factory :user_with_ideas do
      ignore do
        ideas_count 5
      end

      after_create do |user, evaluator|
        FactoryGirl.create_list(:idea, evaluator.ideas_count, user: user)
      end
    end

    factory :user_with_aspects do
      ignore do
        aspects_count 5
      end
    end
=end
  end
end
