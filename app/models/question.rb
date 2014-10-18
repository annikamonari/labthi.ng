class Question < ActiveRecord::Base
  include PublicActivity::Model
  include LabReputable
  after_create :add_first_vote
  validates :idea, presence: true
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :brief, presence: true, :allow_nil => true, :allow_blank => true, length: {maximum: 500}
  belongs_to :idea
  belongs_to :user, -> { includes :profile }
  has_many :answers, -> { includes :user, :question }, inverse_of: :question, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy

  def ids
    [['Question', self.id]]
  end

end
