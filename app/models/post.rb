class Post < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :idea_build
  belongs_to :user
  has_many :team_applications, -> { includes :user }
  has_many :votes
  has_many :task_comments
  validates_presence_of :content

  def open?
    self.status == 'open'
  end

  def proposal?
    self.kind == 'team'
  end
end
