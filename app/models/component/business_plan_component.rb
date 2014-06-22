class BusinessPlanComponent < Component
  
  def create_required_parts
    names = [
      "Advisory",
      "Cover Sheet",
      "Table of Contents",
      "Executive Summary",
      "Summary of Business",
      "Products or Services",
      "Administrative Plan",
      "Marketing Strategy",
      "Market Analysis",
      "Customer Service",
      "Marketing Strategy Implementation",
      "Assessment of Market Effectiveness",
      "Summary of Financial Needs",
      "Dispersal of Loan Funds Statement",
      "Cash Flow Statement",
      "3 Year Income Projection",
      "Break Even Analysis",
      "Balance Sheet",
      "Profit & Loss Statement",
      "Loan Application/Financial History (Optional)",
      "Financial Statement Analysis"
    ]

    names.each do |name|
      self.parts.create(name:name)
    end
  end
end
