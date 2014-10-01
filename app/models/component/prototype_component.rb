class PrototypeComponent < Component
  
  def create_required_parts
    names = [
      ["Flowchart and Schema", "6%"],
      ["Prototype", "20%"]
    ]

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
