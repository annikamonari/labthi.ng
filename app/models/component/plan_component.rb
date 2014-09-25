class PlanComponent < Component
  
  def create_required_parts
    names = [
      "Idea Scope Summary",
      "Business Scope Summary", 
      "Prototype & Design Specification"
    ]

    names.each do |name|
      self.parts.create(name:name)
    end
  end
end
