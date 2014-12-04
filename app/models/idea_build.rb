class IdeaBuild < ActiveRecord::Base
  belongs_to :idea
  has_one :plan_component, -> { includes(:parts) }
  has_one :business_plan_component, -> { includes(:parts) }
  has_one :prototype_component, -> { includes(:parts) }
  has_one :design_component, -> { includes(:parts) }
  has_many :team_memberships, -> { includes(:user) }
  has_many :posts, -> { includes(:user) }

  before_create :create_required_components

  def create_required_components

    create_plan_component

    create_business_plan_component

    create_prototype_component

    create_design_component
  end
end
