class Idea < ActiveRecord::Base
  validates :phase, presence: true
  validates :brief, presence: true
  validates :industry, presence: true

  has_many :aspects, inverse_of: :idea
end