class Idea < ActiveRecord::Base
  include PublicActivity::Model
  include ActiveModel::Validations
  validates :phase, presence: true
  validates :brief, presence: true
  validate :instance_validations
  validates_presence_of :category_list
  validates_presence_of :component_list
  belongs_to :user, inverse_of: :ideas
  has_many :questions, inverse_of: :idea, :dependent => :destroy
  has_many :solutions, inverse_of: :idea, :dependent => :destroy

  acts_as_taggable_on :categories, :components

  has_reputation :votes, source: :user, aggregated_by: :sum

  def image_aspect
    Aspect.find_or_create_by(title: "Image")
  end

  def instance_validations
  	validates_with MaxCategories
  end
end