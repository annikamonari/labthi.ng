class BusinessPlanComponent < Component
  
  def create_required_parts
    names = [
      "Executive Summary",
      "Summary of Business",
      "Products or Services",
      "Marketing Strategy",
      "Market Analysis",
      "Customer Service",
      "Marketing Strategy Implementation",
      "Assessment of Market Effectiveness"
    ]

    names.each do |name|
      self.parts.create(name:name, status:'Unstarted', button_status:'Start')
    end
  end
end
