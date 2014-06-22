class Component < ActiveRecord::Base
  has_many :parts
  belongs_to :idea_build

  # child classes implement create_required_parts
  before_create :create_required_parts

  private

  def create_component_part(name)
    part = Part.new
    part.name = name
    part.component_id = self.id
    part.save
  end
end
