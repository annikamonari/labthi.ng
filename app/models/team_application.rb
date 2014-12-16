class TeamApplication < ActiveRecord::Base
  belongs_to :post, -> { includes(:user) }
  belongs_to :user
  has_many :votes
  has_many :task_comments
  after_create :create_notification

  def accepted?(idea_build)
    TeamMembership.find_by(idea_build_id: idea_build.id, user_id: self.user) != nil
  end

  def get_comments
    TaskComment.where(kind: 'Application', kind_id: self.id)
  end

  private 
    def create_notification
      TeamMembership.where(idea_build_id: self.post.idea_build_id).pluck(:user_id).each do |user_id|
        Notification.create(Post.find(self.post_id), self.id, 'post_application', user_id)
      end
    end
end
