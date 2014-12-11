class TeamApplication < ActiveRecord::Base
  belongs_to :post, -> { includes(:user) }
  belongs_to :user
  has_many :votes
  has_many :task_comments

  def accepted?(idea_build)
    TeamMembership.find_by(idea_build_id: idea_build.id, user_id: self.user) != nil
  end

  def get_comments
    TaskComment.where(kind: 'Application', kind_id: self.id)
  end
end
