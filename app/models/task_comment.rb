class TaskComment < ActiveRecord::Base
  belongs_to :user, -> { includes :profile }
  belongs_to :admin_task
  belongs_to :post
  belongs_to :team_application

  after_create :create_notification

  def create_notification
    parent = nil
    if self.kind == 'Task'
      parent = AdminTask.find(self.kind_id)
    elsif self.kind == 'Application'
      parent = TeamApplication.find(self.kind_id)
    else
      parent = Post.find(self.kind_id)
    end

    idea_build_id = nil
    if self.kind == 'Post'
      idea_build_id = Post.find(self.kind_id).idea_build_id
    elsif self.kind == 'Task'
      idea_build_id = AdminTask.find(self.kind_id).part.idea_build.id
    end
    
    unless self.kind == 'Application'
      TeamMembership.where(idea_build_id: idea_build_id).pluck(:user_id).each do |user_id|
        Notification.create(parent, self.id, self.kind.downcase + '_taskcomment', user_id)
      end
    end
  end
end
