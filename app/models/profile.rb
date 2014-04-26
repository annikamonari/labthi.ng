class Profile < ActiveRecord::Base
  include PublicActivity::Model
	validates :user_id, presence: true
	belongs_to :user

    website_regex = /\b(https?:\/\/|^[^https?:\/])\.?(.*\.[A-Z]{2,}+[A-Z\/])/xi
	validates :website, :format => {:with => website_regex, :message => "The website you provided is invalid." }, 
                        :allow_blank => true,
                        :allow_nil => true, length: { maximum: 30 }
    validates :age, presence: true, :allow_blank => true, :allow_nil => true
    validates :country, presence: true, length: { maximum: 55 }, :allow_blank => true, :allow_nil => true
    validates :profession, presence: true, length: { maximum: 40 }, :allow_blank => true, :allow_nil => true
    validates :about, presence: true, length: { maximum: 1000 }, :allow_blank => true, :allow_nil => true

    mount_uploader :photo, PhotoUploader
end
