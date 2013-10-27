class Solution < ActiveRecord::Base
  include PublicActivity::Model
  include SharedMethods
  after_create :set_first_vote
  validates :brief, presence: true, length: { maximum: 1000 }
  validates :user, presence: true
  validates :aspect, presence: true
  validates :idea, presence: true
  belongs_to :aspect
  belongs_to :idea
  belongs_to :user
  has_many :comments, as: :commentable, :dependent => :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum
  
  mount_uploader :image, ImageUploader
end
