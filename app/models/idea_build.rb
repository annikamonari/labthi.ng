class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component
  has_one :ip_component
  has_one :business_plan_component
  has_one :prototype_component
  has_one :design_component

  before_create :create_required_components

  def create_required_components
    create_component(PlanComponent.new)
    create_component(IpComponent.new)
    create_component(BusinessPlanComponent.new)
    create_component(PrototypeComponent.new)
    create_component(DesignComponent.new)
  end

  def create_component(component)
    component.idea_build_id = self.id
    component.save
  end
end
