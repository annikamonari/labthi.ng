class DesignComponent < Component
  
  def create_required_parts
    names = [
      ["Logo", "2%"],
      ["Wireframes", "6%"],
      ["Mockups", "8%"]
    ]

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
