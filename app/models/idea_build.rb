class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component, -> { includes(:parts) }
  has_one :business_plan_component, -> { includes(:parts) }
  has_one :prototype_component, -> { includes(:parts) }
  has_one :design_component, -> { includes(:parts) }
  has_many :team_memberships, -> { includes(:user) }
  has_many :posts, -> { includes(:user) }

  after_create :create_required_components

  def create_required_components
    create_component(PlanComponent)
    create_component(BusinessPlanComponent)
    create_component(DesignComponent)
    create_component(PrototypeComponent)
  end

  def no_progress?
    no_progress = 0
    no_progress += self.plan_component.get_progress
    no_progress += self.business_plan_component.get_progress
    no_progress += self.design_component.get_progress
    no_progress += self.prototype_component.get_progress
    
    no_progress == 0
  end

  private
    def create_component(component) 
      c               = component.new
      c.idea_build_id = self.id
      c.save
    end
end
