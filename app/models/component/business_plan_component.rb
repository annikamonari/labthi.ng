class BusinessPlanComponent < Component
  
  def create_required_parts
    names = [
      "Summary of Business",
      "Summary of Product",
      "Marketing Strategy Plan",
      "Market Analysis",
      "Marketing Strategy Implementation",
      "Executive Summary"
    ]

    names.each do |name|
      self.parts.create(name:name, status:'Unstarted')
    end
  end
end
