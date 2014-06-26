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
      self.parts.create(name:name)
    end
  end
end
