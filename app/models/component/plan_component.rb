class PlanComponent < Component
  
  def create_required_parts
    names = [
      "Advisory",
      "Idea Scope Summary",
      "Business Scope Summary", 
      "Prototype & Design Flowchart, List & Explanations",
      "Survey",
      "IP Survey",
      "Prototype Survey",
      "Design Survey"
    ]

    names.each do |name|
      self.parts.create(name:name)
    end
  end
end
