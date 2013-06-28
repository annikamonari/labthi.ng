class Idea < ActiveRecord::Base
  validates :phase, presence: true
  validates :brief, presence: true
  validates :industry, presence: true
end