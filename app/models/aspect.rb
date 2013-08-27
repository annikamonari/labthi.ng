class Aspect < ActiveRecord::Base
  include PublicActivity::Model
  validates :brief, presence: true
  validates :user_id, presence: true
  validates :idea_id, presence: true

  belongs_to :idea, inverse_of: :aspects
  belongs_to :user, inverse_of: :aspects
  has_many :solutions, inverse_of: :aspect, :dependent => :destroy
end
