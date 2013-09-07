class Idea < ActiveRecord::Base
  include PublicActivity::Model
  include ActiveModel::Validations
  validates :phase, presence: true
  validates :brief, presence: true
  validate :instance_validations
  validates_presence_of :category_list
  validates_presence_of :component_list
  belongs_to :user, inverse_of: :ideas
  has_many :aspects, inverse_of: :idea, :dependent => :destroy
  has_many :questions, inverse_of: :idea, :dependent => :destroy

  acts_as_taggable_on :categories, :components

  accepts_nested_attributes_for :aspects, :allow_destroy => true


  def instance_validations
  	validates_with MaxCategories
  end
end