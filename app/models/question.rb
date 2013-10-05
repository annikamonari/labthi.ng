class Question < ActiveRecord::Base
  include PublicActivity::Model
  validates :idea, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :answers_expected, presence: true
  belongs_to :idea
  belongs_to :user
  has_many :answers, inverse_of: :question, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy

  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
