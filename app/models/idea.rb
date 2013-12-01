class Idea < ActiveRecord::Base
  include PublicActivity::Model
  include ActiveModel::Validations
  include SharedMethods
  include LabReputable
  after_create :set_first_vote
  validates :phase, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :brief, presence: true, length: { maximum: 500 }
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


  def top_image
    @top_image = nil
    image_aspect = Aspect.where(title:"Image").take
    if (image_aspect)
      @solution = Solution.where(aspect_id: image_aspect.id, idea_id: self.id).sort_by {|a| a.reputation_for(:votes)}.last
      @top_image = @solution if @solution
    end
    return @top_image
  end

  def instance_validations
  	validates_with MaxCategories
  end

  def self.categories
    [
      "Advertising & Media",
      "Arts & Entertainment",
      "Business & Finance",
      "Education",
      "Energy & Utilities",
      "Food & Health",
      "Science & Technology",
      "Social",
      "Travel & Leisure",
      "Retail",
      "Other"
    ]
  end

  def self.components
    [
      "Website",
      "App",
      "Software",
      "Hardware",
      "Good",
      "Service"
    ]
  end

end