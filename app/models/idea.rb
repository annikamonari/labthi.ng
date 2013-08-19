class Idea < ActiveRecord::Base
  include PublicActivity::Model
  validates :phase, presence: true
  validates :brief, presence: true
  validates :industry, presence: true
  belongs_to :user, inverse_of: :ideas
  has_many :aspects, inverse_of: :idea, :dependent => :destroy

  accepts_nested_attributes_for :aspects, :allow_destroy => true
end