class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  has_many :ideas, inverse_of: :user
  has_many :questions, inverse_of: :user
  has_many :aspects, inverse_of: :user
  has_many :answers, inverse_of: :user
  has_many :solutions, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_one :profile, dependent: :destroy

  after_create :create_user_profile

  def create_user_profile
    Profile.create(:user_id => self.id)
  end
end
