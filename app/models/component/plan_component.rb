class PlanComponent < Component
  before_create :create_required_parts

  def create_required_parts
    names = [
      "Advisory",
      "Idea Scope Summary",
      "Business Scope Summary", 
      "Prototype & Design Flowchart, List & Explanations",
      "Survey"
    ]

    names.each do |name|
      create_component_part("Advisory")
    end
  end
end
