FactoryGirl.define do
  factory :user do
    email { "person#{Time.new.usec}@example.com" }
    name "Example User"
    password               '12345678'
    password_confirmation  '12345678'
  end
end