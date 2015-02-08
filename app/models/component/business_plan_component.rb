class BusinessPlanComponent < Component
  
  def create_required_parts
    names = [
      ["Executive Summary", "6%"],
      ["Background - Business and Product", "6%"],
      ["Market Demand", "8%"],
      ["Competition", "8%"],
      ["Strategy", "8%"],
      ["Financials", "6%"],
      ['Investment Highlights', '6%']
    ]

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
