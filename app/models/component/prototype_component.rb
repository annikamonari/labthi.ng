class PrototypeComponent < Component
  
  def create_required_parts
    names = [
      "CAD/Flowchart",
      "Prototype Draft",
      "Prototype Final"
    ]

    names.each do |name|
      self.parts.create(name:name)
    end
  end
end
