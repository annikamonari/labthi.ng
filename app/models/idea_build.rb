class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component
  has_one :ip_component
  has_one :business_plan_component
  has_one :prototype_component
  has_one :design_component

  before_create :create_required_components

  def create_required_components

    create_plan_component

    create_business_plan_component

    create_prototype_component

    create_design_component
  end
end
