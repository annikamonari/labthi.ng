class Comment < ActiveRecord::Base
  include PublicActivity::Model
	validates :brief, presence: true
	validates :user, presence: true
	belongs_to :user, inverse_of: :comments
	belongs_to :answer
	belongs_to :solution
	belongs_to :question
	belongs_to :comment
	belongs_to :commentable, :polymorphic => true
	has_many :comments, as: :commentable, :dependent => :destroy
  	
  has_reputation :votes, source: :user, aggregated_by: :sum
end
