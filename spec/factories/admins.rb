# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email { "admin#{Time.new.usec}@example.com" }
    name "Example Admin"
    password               '12345678'
    password_confirmation  '12345678'
  end
end
