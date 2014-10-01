FactoryGirl.define do
  factory :part_upload do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'profile_photos', 'default.png')) }
    part
  end
end