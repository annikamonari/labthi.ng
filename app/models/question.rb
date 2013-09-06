class Question < ActiveRecord::Base
  include PublicActivity::Model
  validates :idea, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :answers_expected, presence: true
  belongs_to :idea
  belongs_to :user
  has_many :solutions, inverse_of: :question, :dependent => :destroy
end
