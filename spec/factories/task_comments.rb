# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_comment do
    admin_task_id 1
    user_id 1
    comment "MyText"
    user
    admin_task
  end
end
