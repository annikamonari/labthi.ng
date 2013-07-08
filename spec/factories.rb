# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password '12345678'

    factory :user_with_ideas do
      after_create do |user|
        create(:idea, user: user)
      end
    end
    factory :user_with_aspects do
      after_create do |user|
        create(:aspect, user: user)
      end
    end
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name 'Admin'
    last_name  'User'
    admin      true
  end

  factory :aspect do
    title 'Valid title'
    brief 'Valid brief'
    idea
    user
  end

  factory :idea do
    brief 'Valid brief'
    phase 1
    active true
    industry 'Technology'
    factory :idea_with_aspects do
      after_create do |idea|
        create(:idea, aspect: aspect)
      end
    end
    user
  end
end