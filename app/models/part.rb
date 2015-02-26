class Part < ActiveRecord::Base
  # Used to associate image galaries from bootsy to this model
  include Bootsy::Container
  include PublicActivity::Model
  include LabReputable
  
  has_many :part_uploads
  has_many :admin_tasks, -> { includes(:part) }
  has_many :votes

  belongs_to :user, -> { includes(:profile) }
  belongs_to :component, -> { includes(:idea_build) }

  after_create :default_brief

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

  def is_upload?
    [].include?(self.name)
  end

  def is_editor?
    [].include?(self.name)
  end

  def is_started?
    self.status == 'Started'
  end

  def is_in_review?
    self.status == 'In Review'
  end

  # Used for idea_build overview views
  def display_link?(user)
    TeamMembership.where(idea_build_id: self.idea_build.id).any? {|tm| tm.user_id == user.id}
  end

  def restrict_edit_privilege?(user)
    not user_is_owner?(user)
  end

  def locked_or_disabled?(user)
    disabled?(user) or locked? 
  end

  def display_button?(user)
    self.status != 'Accepted' and (self.status == 'Unstarted' or user_is_owner?(user))
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

  def start_rep_points
    self.update_lab_evaluation(10, User.find_by(email: 'alan.vey@gmail.com'))
    self.user.update_lab_rep_points
  end

  def unstart_rep_points
    self.update_lab_evaluation(-10, User.find_by(email: 'alan.vey@gmail.com'))
    self.user.update_lab_rep_points
  end

  def accepted_rep_points 
    self.update_lab_evaluation(10 + ((self.equity.to_i / 100.0) * 1000.0).to_i, 
                                 User.find_by(email: 'alan.vey@gmail.com'))
    self.user.update_lab_rep_points
  end

  def ids
    [['Part', self.id]]
  end

  def value_changed?
    Part.find(self.id).value == self.value
  end

  private

    def locked?
      self.status == 'Finished'
      # Set up part depandancies here
    end

    def disabled?(user)
      (!(['Unstarted', 'Accepted'].include?(self.status)) and !user_is_owner?(user)) or working_on_another_part?(user)
    end

    def user_is_owner?(user)
      self.user == user
    end

    def working_on_another_part?(user)
      part  = Array.new
      part += idea_build.business_plan_component.parts.where(user_id: user.id)
      part += idea_build.prototype_component.parts.where(user_id: user.id)
      part += idea_build.design_component.parts.where(user_id: user.id) 

      unless part.nil?
        part.any? { |p| p.status == 'Started' } and self.status != 'Started' 
      end

      false
    end

    def default_brief
      if self.name == 'Brief'
        self.value = 'Please visit the <b>build</b> tab and write your brief so that the community can understand your idea; 
                      when you write a proposal for obtaining team members they will want to
                      understand your mission, product features, and future plan.'
        self.save!
      end
    end
end
