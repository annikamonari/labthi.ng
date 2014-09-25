class DesignComponent < Component
  
  def create_required_parts
    names = [
      "Logo",
      "Wireframes",
      "Mockups"
    ]

    names.each do |name|
      self.parts.create(name:name)
    end
  end
end
