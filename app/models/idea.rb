class Idea < ActiveRecord::Base
  include PublicActivity::Model

  include ActiveModel::Validations
  include LabReputable
  after_create :add_first_vote
  validates :phase, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :brief, presence: true, length: { maximum: 1000 }
  validate :instance_validations
  validates_presence_of :category_list
  validates_presence_of :component_list
  validates_presence_of :create_days
  belongs_to :user, -> { includes :profile }, inverse_of: :ideas
  has_many :questions, inverse_of: :idea, :dependent => :destroy
  has_many :solutions, inverse_of: :idea, :dependent => :destroy


  has_many :reverse_idea_relationships, foreign_key: "followed_id",
                                        class_name: "IdeaRelationship",
                                        dependent: :destroy

  has_many :followers, through: :reverse_idea_relationships

  has_one :idea_build, -> { includes( :plan_component => :parts, 
                                      :business_plan_component => :parts, 
                                      :design_component => :parts, 
                                      :prototype_component => :parts ) }
  has_many :buy_phase_votes

  acts_as_taggable_on :categories, :component
  mount_uploader :image, ImageUploader

  NO_CREATE_DAYS = [1, 5, 10, 15, 20, 25, 30]

  def image_aspect
    Aspect.find_or_create_by(title: "Image")
  end


  def top_image(thumbnail=false)
    if thumbnail
      self.image.thumb.to_s
    elsif thumbnail == nil
      self.image.phase2.to_s
    else
      self.image.display.to_s
    end
  end

  def top_image_thumb
    top_image(true)
  end

  def phase_2_image
    top_image(nil)
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
      "Mobile App",
      "Software",
    ]
  end

  def promote!
    if phase < 3
      self.phase += 1
      self.save
    end

    if phase == 2
      idea_build = IdeaBuild.new
      idea_build.idea_id = self.id
      idea_build.save
      Bitbucket.new(self.title, self.id).create
      TeamMembership.create(self.user.id, idea_build.id)
    end
  end

  def is_phase_1?
    self.phase == 1
  end

  def ids
    [['Idea', self.id]]
  end

  def get_idea_activities
    activities = Array.new
    get(:ids).each do |type, id|
      next if type == 'AdminTask'
      activities += PublicActivity::Activity.includes(:trackable, { :owner => :profile }).where(
       trackable_id: id, trackable_type: type)

    end
    activities.sort_by { |a| Time.now - a.created_at }
  end

  def get(method)
    users_points = Array.new
    users_points += self.send(method)

    self.questions.includes(:answers).each do |q|
      users_points += q.send(method)
      q.answers.includes(:comments).each do |a|
        users_points += a.send(method)
        a.comments.includes(:comments).each do |c|
          users_points += c.send(method)
          c.comments do |cc|
            users_points += cc.send(method)
          end 
        end
      end
      q.comments.includes(:comments).each do |c|
        users_points += c.send(method)
        c.comments.each do |cc|
          users_points += cc.send(method)
        end
      end
    end

    self.solutions do |s|
      users_points += s.send(method)
      s.comments.includes(:comments).each do |c|
        users_points += c.send(method)
        c.comments.each do |cc|
          users_points += cc.send(method)
        end
      end
    end

    if self.phase >= 2
      id_build = IdeaBuild.find_by(idea_id: self.id)

      id_build.plan_component.parts.includes(:admin_tasks).each do |part|
        users_points += part.send(method)
        part.admin_tasks.each do |ac|
          users_points += ac.send(method)
        end
      end
      id_build.business_plan_component.parts.includes(:admin_tasks).each do |part|
        users_points += part.send(method)
        part.admin_tasks.each do |ac|
          users_points += ac.send(method)
        end
      end
      id_build.prototype_component.parts.includes(:admin_tasks).each do |part|
        users_points += part.send(method)
        part.admin_tasks.each do |ac|
          users_points += ac.send(method)
        end
      end
      id_build.design_component.parts.includes(:admin_tasks).each do |part|
        users_points += part.send(method)
        part.admin_tasks.each do |ac|
          users_points += ac.send(method)
        end
      end
    end

    users_points 
  end

  def increase_create_days
    self.create_days += 1.day
    self.save
  end

  # Phase 3 ===================================================================

  def get_buy_votes
    BuyPhaseVote.where(idea_id: self.id, buy: true).count
  end

  def get_use_votes
    BuyPhaseVote.where(idea_id: self.id, buy: false).count
  end

end