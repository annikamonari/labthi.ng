# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part_upload do
    part_id 1
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'profile_photos', 'default.png')) }
    part 
  end
end
