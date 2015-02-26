class Post < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :idea_build
  belongs_to :user
  has_many :team_applications, -> { includes :user }
  has_many :votes
  has_many :task_comments
  validates_presence_of :content

  mount_uploader :image, ImageUploader

  def open?
    self.status == 'open'
  end

  def proposal?
    self.kind == 'team'
  end

  def get_comments
    TaskComment.where(kind: 'Post', kind_id: self.id)
  end

  def image_nil?
    self.image.url =~ /default.png/
  end

  def like(user)
    Like.find_by(model_name: self.class, model_id: self.id, user_id: user.id)
  end

  private
    def create_notification
      notification_kind = nil
      if self.kind == 'news'
        notification_kind = 'ideabuild_post'
      else
        notification_kind = 'ideabuild_proposal'
      end
      TeamMembership.where(idea_build_id: self.idea_build_id).pluck(:user_id).each do |user_id|
        Notification.create(IdeaBuild.find(self.idea_build_id), self.id, notification_kind, user_id)
      end
    end
end
