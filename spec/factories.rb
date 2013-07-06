# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password '12345678'
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
    user
    idea
  end

  factory :idea do
    brief 'Valid brief'
    phase 1
    active true
    industry 'Technology'
    user
  end
end