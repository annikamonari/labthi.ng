FactoryGirl.define do
  factory :user do
    email { "person#{Time.new.usec}@example.com" }
    first_name "Example"
    last_name "User"
    admin false
    password               '12345678'
    password_confirmation  '12345678'
  end
end