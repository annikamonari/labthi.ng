class Solution < ActiveRecord::Base
  include PublicActivity::Model
  validates :brief, presence: true
  validates :user, presence: true
  validates :aspect, presence: true
  validates :idea, presence: true
  belongs_to :aspect
  belongs_to :idea
  belongs_to :user
  has_many :comments, as: :commentable, :dependent => :destroy

  mount_uploader :image, PhotoUploader
end
