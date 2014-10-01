class BusinessPlanComponent < Component
  
  def create_required_parts
    names = [
      ["Summary of Business", "6%"],
      ["Summary of Product", "6%"],
      ["Marketing Strategy Plan", "8%"],
      ["Market Analysis", "8%"],
      ["Marketing Strategy Implementation", "8%"],
      ["Executive Summary", "6%"]
    ]

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
