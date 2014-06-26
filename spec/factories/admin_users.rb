FactoryGirl.define do
  factory :admin_user do
    email { "admin#{Time.new.usec}@example.com" }
    password               '12345678'
    password_confirmation  '12345678'
  end
end
