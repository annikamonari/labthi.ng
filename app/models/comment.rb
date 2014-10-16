class Comment < ActiveRecord::Base
  include PublicActivity::Model
  include LabReputable
  after_create :add_first_vote
	validates :brief, presence: true, length: { maximum: 500 }
	validates :user, presence: true
	belongs_to :user, -> { includes :profile }, inverse_of: :comments
	belongs_to :answer
	belongs_to :solution
	belongs_to :question
	belongs_to :comment
	belongs_to :commentable, :polymorphic => true
	has_many :comments, as: :commentable, :dependent => :destroy

end
