# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_task do
    admin_id 1
    part_id 1
    title "MyString"
    description "MyText"
    status "MyString"
  end
end
