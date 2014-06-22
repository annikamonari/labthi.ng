class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component
  has_one :ip_component
  has_one :business_plan_component
  has_one :prototype_component
  has_one :design_component

  before_create :create_required_components

  def create_required_components
    self.plan_component = PlanComponent.new
    create_component(plan_component)

    self.ip_component = IpComponent.new
    create_component(ip_component)

    self.business_plan_component = BusinessPlanComponent.new
    create_component(business_plan_component)

    self.prototype_component = PrototypeComponent.new
    create_component(prototype_component)

    self.design_component = DesignComponent.new
    create_component(design_component)
  end

  def create_component(component)
    component.idea_build_id = self.id
    component.save
  end
end
