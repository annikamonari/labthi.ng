# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyText"
    brief "MyText"
    idea
    user
  end
end
