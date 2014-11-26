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
  validates :admin, presence: true, :allow_nil => true, allow_blank: true

  has_many :ideas, inverse_of: :user
  has_many :questions, inverse_of: :user
  has_many :aspects, inverse_of: :user
  has_many :answers, inverse_of: :user
  has_many :solutions, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :task_comments
  has_one :profile, dependent: :destroy

  has_many :idea_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_ideas, -> { includes :user }, through: :idea_relationships, source: :followed
  has_many :buy_phase_votes
  has_many :posts

  has_many :team_memberships
  
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

  def get_followed_idea_activity
    follow_activities = Array.new
    self.followed_ideas.each do |idea|
      follow_activities += idea.get_idea_activities
    end
    follow_activities.sort_by { |a| Time.now - a.created_at } 
  end

  def get_equity(idea)
    equities = Array.new
    idea.idea_build.plan_component.parts.where(user_id: self.id, status: 'Accepted').each { |part| equities << part.equity.to_i }
    idea.idea_build.business_plan_component.parts.where(user_id: self.id, status: 'Accepted').each { |part| equities << part.equity.to_i }
    idea.idea_build.prototype_component.parts.where(user_id: self.id, status: 'Accepted').each { |part| equities << part.equity.to_i }
    idea.idea_build.design_component.parts.where(user_id: self.id, status: 'Accepted').each { |part| equities << part.equity.to_i }
    
    if equities.empty?
      '0%'
    else
      equities.inject{ |sum, e| sum + e }.to_s + '%' 
    end
  end

  # Phase 3 ===================================================================
  def buy_phase_vote?(idea)
    BuyPhaseVote.where(idea_id: idea.id, user_id: self.id).count == 1
  end
end
