class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component

  before_create :create_required_components

  def create_required_components
    plan_component = PlanComponent.new
    plan_component.idea_build_id = self.id
  end
end
