class PrototypeComponent < Component
  def create_required_parts
    names = [
      "CAD/Flowchart",
      "Prototype Draft",
      "Prototype Final"
    ]

    names.each do |name|
      create_component_part(name)
    end
  end
end
