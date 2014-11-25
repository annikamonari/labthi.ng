require 'rails_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
    @profile = FactoryGirl.build(:profile)
    @part_upload = FactoryGirl.build(:part_upload)
  end

  after do
    PhotoUploader.enable_processing = false
  end

  context 'the display version' do
    it "should scale down a profile photo to be exactly 300 by 300 pixels" do
      @profile.photo.display.should be_no_larger_than(300, 300)
      @part_upload.image.display.should be_no_larger_than(300, 300)
    end
  end

  context 'the thumb version' do
    it "should scale down a profile photo to be exactly 60 by 60 pixels" do
      @profile.photo.thumb.should be_no_larger_than(60, 60)
      @part_upload.image.thumb.should be_no_larger_than(60, 60)
    end
  end 

end




