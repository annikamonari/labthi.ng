class Idea < ActiveRecord::Base
  include PublicActivity::Model
  include ActiveModel::Validations
  include LabReputable
  after_create :add_first_vote
  validates :phase, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :brief, presence: true, length: { maximum: 500 }
  validate :instance_validations
  validates_presence_of :category_list
  validates_presence_of :component_list
  belongs_to :user, inverse_of: :ideas
  has_many :questions, inverse_of: :idea, :dependent => :destroy
  has_many :solutions, inverse_of: :idea, :dependent => :destroy

  acts_as_taggable_on :categories, :component

  def image_aspect
    Aspect.find_or_create_by(title: "Image")
  end


  def top_image(thumbnail=false)
    top_image = nil
    image_aspect = Aspect.where(title:"Image").take
    if (image_aspect)
      solution = Solution.where(aspect_id: image_aspect.id, idea_id: self.id).sort_by {|a| a.lab_rep}.last
    end

    if solution then
      if thumbnail
        top_image = solution.image.thumb.to_s
      elsif solution
        top_image = solution.image.display.to_s
      end
    else
      if thumbnail
        top_image = 'thumb_default.png'
      else
        top_image = 'display_default.png'
      end
    end

    return top_image
  end

  def top_image_thumb
    top_image(true)
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