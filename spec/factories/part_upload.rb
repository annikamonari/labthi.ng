FactoryGirl.define do
  factory :part_upload do
    part
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'profile_photos', 'default.png')) }
  end
end