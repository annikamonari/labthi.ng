class Profile < ActiveRecord::Base
  include PublicActivity::Model
	validates :user_id, presence: true
	belongs_to :user

	validates :website, :allow_blank => true,
                        :allow_nil => true, length: { maximum: 30 }
    validates :country, presence: true, length: { maximum: 55 }, :allow_blank => true, :allow_nil => true
    validates :about, presence: true, length: { maximum: 1000 }, :allow_blank => true, :allow_nil => true

    mount_uploader :photo, PhotoUploader
end
