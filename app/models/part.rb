class Part < ActiveRecord::Base
  # Used to associate image galaries from bootsy to this model
  include Bootsy::Container
  has_many :part_uploads

  belongs_to :user
  belongs_to :component

  def idea
    @idea ||= idea_build.idea
  end

  def idea_build
    @idea_build ||= component.idea_build
  end

  # Used for part edit views
  def is_design?
    self.component.instance_of?(DesignComponent)
  end

  def is_prototype?
    self.component.instance_of?(PrototypeComponent)
  end

  def is_plan?
    self.component.instance_of?(PlanComponent)
  end

  def is_started?
    self.status == 'Started'
  end

  # Used for idea_build overview views
  def display_link?(user)
    (is_started? and self.user == user) or user.admin
  end

  def locked_or_disabled?(user)
    locked? or disabled?(user)
  end

  def display_button?(user)
    self.status != 'Accepted' and (self.status == 'Unstarted' or display_link?(user))
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
      'Revew'
    when 'In Review'  
      'Accept' 
    end
  end


  private

    def locked?
      plan_done? or schema_done? or wireframes_done? or business_plan_parts_done?
    end

    def business_plan_parts_done?
      self.name == 'Executive Summary' and 
      idea_build.business_plan_component.parts.any? { |p| p.name != 'Executive Summary' and p.status != 'Accepted' }
    end

    def schema_done?
      self.name == 'Prototype' and 
      idea_build.prototype_component.parts.find_by(name: 'Flowchart and Schema').status != 'Accepted'
    end

    def wireframes_done?
      self.name == 'Mockups' and 
      idea_build.design_component.parts.find_by(name: 'Wireframes').status != 'Accepted'
    end

    def plan_done?
      idea_build.plan_component.parts[0].status != 'Accepted' and (not is_plan?)
    end

    def disabled?(user)
      !(['Unstarted', 'Accepted'].include?(self.status)) and !display_link?(user)
    end

end
