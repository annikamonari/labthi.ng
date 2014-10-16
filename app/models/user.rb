class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_many :ideas, inverse_of: :user
  has_many :questions, inverse_of: :user
  has_many :aspects, inverse_of: :user
  has_many :answers, inverse_of: :user
  has_many :solutions, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :task_comments
  has_one :profile, dependent: :destroy

  has_many :idea_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_ideas, through: :idea_relationships, source: :followed
  
  after_create :create_user_profile

  def name
    first_name.to_s + " " + last_name.to_s
  end

  def update_lab_rep_points
    evals_as_evaluator = LabEvaluation.where(evaluator:self)
    evals_as_content_creator = LabEvaluation.where(content_creator:self)

    points = 0
    evals_as_evaluator.each do |e|
      unless e.evaluator_id == e.content_creator_id #prevent user from getting double points
        points += e.weighted_value_for_evaluator
      end
    end

    evals_as_content_creator.each do |e|
      points += e.weighted_value_for_content_creator
    end

    points = 0 if points < 0

    self.points = points.to_i
    self.save!
  end

  def lab_rep_points
    if self.points == nil then
      self.points = 0
      self.save!
    end

    return self.points
  end

  def create_user_profile
    Profile.create(:user_id => self.id)
  end

  def up_voted_for?(item)
    eval = LabEvaluation.where(evaluator: self, content: item).first
    eval.present? && eval.value > 0 ? eval : false
  end

  def down_voted_for?(item)
    eval = LabEvaluation.where(evaluator: self, content: item).first
    eval.present? && eval.value < 0 ? eval : false
  end

  def voted_for?(item)
    eval = LabEvaluation.where(evaluator: self, content: item).first
    eval.present? ? eval : false
  end
  
  def following_idea?(idea)
    idea_relationships.find_by(followed_id: idea.id)
  end

  def follow_idea!(idea)
    idea_relationships.create!(followed_id: idea.id)
  end

  def unfollow_idea!(idea)
    idea_relationships.find_by(followed_id: idea.id).destroy
  end
end
