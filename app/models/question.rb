class Question < ActiveRecord::Base
  include PublicActivity::Model
  include SharedMethods
  after_create :set_first_vote
  validates :idea, presence: true
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :brief, presence: true, :allow_nil => true, :allow_blank => true, length: {maximum: 500}
  validates :answers_expected, presence: true
  belongs_to :idea
  belongs_to :user
  has_many :answers, -> { includes :user }, inverse_of: :question, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy

  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
