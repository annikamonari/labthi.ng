FactoryGirl.define do
  factory :profile do
    website 'http://www.validwebsite.com'
    country 'Valid country'
    about 'Valid about statements that go on and on'
    profession 'Validprofession'
    age 22
    user
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'profile_photos', 'default.png')) }
  end
end