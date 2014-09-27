class PrototypeComponent < Component
  
  def create_required_parts
    names = [
      "Flowchart and Schema",
      "Prototype"
    ]

    names.each do |name|
      self.parts.create(name:name, status:'Unstarted')
    end
  end
end
