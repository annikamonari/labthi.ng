# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part do
    name "MyString"
    value "MyText"
    user
    component { create(:plan_component) }
  end
end
