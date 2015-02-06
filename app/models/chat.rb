class Chat < ActiveRecord::Base
  belongs_to :user
  has_many :notifications
  validates_presence_of :body
  after_create :create_notification

  mount_uploader :attachment, AttachmentUploader

  private
    def create_notification
      parent = nil
      if self.kind == 'idea_build'
        parent = IdeaBuild.find(self.kind_id)
      else
        parent = Part.find(self.kind_id)
      end

      idea_build_id = self.kind == 'part' ? Part.find(kind_id).idea_build.id : IdeaBuild.find(kind_id).id
      TeamMembership.where(idea_build_id: idea_build_id).pluck(:user_id).each do |user_id|
        Notification.create(parent, self.id, self.kind + '_chat')
      end
    end
end
