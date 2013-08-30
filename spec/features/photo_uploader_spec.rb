require 'spec_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
    @profile = FactoryGirl.build(:profile)
  end

  after do
    PhotoUploader.enable_processing = false
  end

  context 'the display version' do
    it "should scale down a profile photo to be exactly 150 by 150 pixels" do
      @profile.photo.display.should be_no_larger_than(150, 150)
    end
  end

  context 'the thumb version' do
    it "should scale down a profile photo to be exactly 50 by 50 pixels" do
      @profile.photo.thumb.should be_no_larger_than(50, 50)
    end
  end 

end




