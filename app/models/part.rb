class Part < ActiveRecord::Base
  # Used to associate image galaries from bootsy to this model
  include Bootsy::Container
  has_many :part_uploads
  has_many :admin_tasks

  belongs_to :user, -> { includes(:profile) }
  belongs_to :component

  def idea
    @idea ||= idea_build.idea
  end

  def idea_build
    @idea_build ||= component.idea_build
  end

  # Used for part edit views
  def is_design?
    self.component.instance_of?(DesignComponent) or 
    self.name == 'Flowchart and Schema'
  end

  def is_prototype?
    self.component.instance_of?(PrototypeComponent)
  end

  def is_plan?
    self.component.instance_of?(PlanComponent)
  end

  def is_business_plan?
    self.component.instance_of?(BusinessPlanComponent)
  end

  def is_started?
    self.status == 'Started'
  end

  def is_in_review?
    self.status == 'In Review'
  end

  # Used for idea_build overview views
  def display_link?(user)
    show_link?(user) or restrict_access_to_editor?(user) or 
    restrict_access_to_design?(user) or users_work_is_reviewd?(user)
  end

  def restrict_access_to_editor?(user)
    restricted_access_to_plan?(user) or restricted_access_to_business_plan?(user)
  end

  def restrict_access_to_design?(user)
    restricted_access_to_mockups?(user) or restricted_access_to_protype?(user)
  end

  def locked_or_disabled?(user)
    locked? or disabled?(user)
  end

  def display_button?(user)
    self.status != 'Accepted' and (self.status == 'Unstarted' or show_link?(user))
  end

  def disabled_status
    locked? ? 'Locked' : self.status
  end

  def button_status
    case self.status
    when 'Unstarted'
      'Start'  
    when 'Started'
      'Finish'
    when 'Finished'
      'Review'
    when 'In Review'  
      'Accept' 
    end
  end

  def bitbucket
    Bitbucket.new(self.idea.title, self.idea.id)
  end

  private

    def restricted_access_to_mockups?(user)
      if is_design?
        mockup = idea_build.design_component.parts.find_by(name: 'Mockups')
        user == mockup.user and mockup.status == 'Started' and 
        self.name != 'Mockups' and self.status == 'Accepted'
      end
    end

    def restricted_access_to_protype?(user)
      if is_prototype? or is_design?
        prototype = idea_build.prototype_component.parts.find_by(name: 'Prototype')
        user == prototype.user and prototype.status == 'Started' and 
        self.name != 'Prototype' and self.status == 'Accepted'
      end
    end

    def restricted_access_to_plan?(user)
      is_plan? and !(self.status == 'Started' and self.user == user) and
      (idea_build.business_plan_component.parts.any? { |p| p.user == user } or 
       idea_build.prototype_component.parts.any?     { |p| p.user == user } or
       idea_build.design_component.parts.any?        { |p| p.user == user } )
    end

    def restricted_access_to_business_plan?(user)
      if is_business_plan?
        exec_sum = idea_build.business_plan_component.parts.find_by(name: 'Executive Summary')
        user == exec_sum.user and exec_sum.status == 'Started' and self.name != 'Executive Summary'
      end
    end

    def plan_done?
      idea_build.plan_component.parts[0].status != 'Accepted' and (not is_plan?)
    end

    def business_plan_parts_done?
      self.name == 'Executive Summary' and 
      (idea_build.business_plan_component.parts.any? do |p| 
        p.name != 'Executive Summary' and p.status != 'Accepted' 
      end)
    end

    def schema_done?
      self.name == 'Prototype' and 
      idea_build.prototype_component.parts.find_by(name: 'Flowchart and Schema').status != 'Accepted'
    end

    def wireframes_done?
      self.name == 'Mockups' and 
      idea_build.design_component.parts.find_by(name: 'Wireframes').status != 'Accepted'
    end

    def locked?
      plan_done? or schema_done? or wireframes_done? or business_plan_parts_done?
    end

    def disabled?(user)
      (!(['Unstarted', 'Accepted'].include?(self.status)) and !show_link?(user)) or working_on_another_part?(user)
    end

    def show_link?(user)
      (is_started? and self.user == user) or user.admin
    end

    def users_work_is_reviewd?(user)
      user == self.user and self.status == 'In Review'
    end

    def working_on_another_part?(user)
      part  = Array.new
      part += idea_build.business_plan_component.parts.where(user_id: user.id)
      part += idea_build.prototype_component.parts.where(user_id: user.id)
      part += idea_build.design_component.parts.where(user_id: user.id) 

      if part.nil?
        false
      else
        part.any? { |p| p.status == 'Started' } and self.status != 'Started' 
      end
    end
end
