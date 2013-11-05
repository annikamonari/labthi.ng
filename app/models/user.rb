class User < ActiveRecord::Base
  has_merit

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
  has_one :profile, dependent: :destroy
  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source
  
  after_create :create_user_profile

  def name
    first_name.to_s + " " + last_name.to_s
  end

  def create_user_profile
    Profile.create(:user_id => self.id)
  end

  def up_voted_for?(item)
    eval = evaluations.where(target_type: item.class, target_id: item.id).first
    eval.present? && eval.value > 0 ? true : false
  end

  def down_voted_for?(item)
    eval = evaluations.where(target_type: item.class, target_id: item.id).first
    eval.present? && eval.value < 0 ? true : false
  end
  
end
