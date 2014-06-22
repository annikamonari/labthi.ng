class Component < ActiveRecord::Base
  has_many :parts
  belongs_to :idea_build

  private

  def create_component_part(name)
    part = Part.new
    part.name = name
    part.component_id = self.id
    part.save
  end
end
