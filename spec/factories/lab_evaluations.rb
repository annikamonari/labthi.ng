# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lab_evaluation do
    evaluator nil
    content_creator nil
    content nil
    value 1
  end
end
