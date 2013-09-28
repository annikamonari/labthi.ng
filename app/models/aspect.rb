class Aspect < ActiveRecord::Base
  include PublicActivity::Model
  validates :title, presence: true
  has_many :solutions, inverse_of: :aspect, :dependent => :destroy

  mount_uploader :image, PhotoUploader
end
