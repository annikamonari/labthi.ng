FactoryGirl.define do
  factory :profile do
    website 'http://www.validwebsite.com'
    country 'Valid country'
    about 'Valid about statements that go on and on'
    profession 'Validprofession'
    age 22
    user
  end
end