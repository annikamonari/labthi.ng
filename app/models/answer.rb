class Answer < ActiveRecord::Base
  include PublicActivity::Model
  validates :brief, presence: true
  validates :user, presence: true
  validates :question, presence: true
  belongs_to :question, inverse_of: :answers
  belongs_to :user, inverse_of: :answers  
  has_many :comments, as: :commentable, :dependent => :destroy
end
