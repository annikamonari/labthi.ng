class Comment < ActiveRecord::Base
  include PublicActivity::Model
	validates :brief, presence: true
	validates :user, presence: true
	validates :solution, presence: true
	belongs_to :user, inverse_of: :comments
	belongs_to :solution, inverse_of: :comments
end