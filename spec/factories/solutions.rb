# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    brief "MyText"
    aspect
    idea
    user
  end
end
