class Comment < ActiveRecord::Base
  include PublicActivity::Model
  include LabReputable
  after_create :add_first_vote
  after_create :create_notification
	validates :brief, presence: true, length: { maximum: 500 }
	validates :user, presence: true
	belongs_to :user, -> { includes :profile }, inverse_of: :comments
	belongs_to :answer
	belongs_to :solution
	belongs_to :question
	belongs_to :comment
	belongs_to :commentable, :polymorphic => true
	has_many :comments, as: :commentable, :dependent => :destroy
  has_many :notifications

  def ids
    [['Comment', self.id]]
  end

  private
    def create_notification
      parent = self.commentable_type.singularize.classify.constantize.find(self.commentable_id)
      Notification.create(parent, self.id, self.commentable_type.downcase + '_comment')
    end
end

