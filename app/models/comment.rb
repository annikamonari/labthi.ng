class Comment < ActiveRecord::Base
  include PublicActivity::Model
	validates :brief, presence: true
	validates :user, presence: true
	belongs_to :user, inverse_of: :comments
	belongs_to :solution
	belongs_to :question
	belongs_to :commentable, :polymorphic => true
end
