class DesignComponent < Component
  def create_required_parts
    names = [
      "Style Tile",
      "Logo",
      "Wireframes Draft",
      "Wireframes Final",
      "Mockups Draft",
      "Mockups Final"
    ]

    names.each do |name|
      create_component_part(name)
    end
  end
end
