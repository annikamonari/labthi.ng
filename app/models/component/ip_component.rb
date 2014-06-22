class IpComponent < Component

  def create_required_parts
    names = [
      "Advisory",
      "Patentability Search & Prior Art Review",
      "Disclosure",
      "Ramifications",
      "Advantages & Disadvantages",
      "Drawings",
      "Background",
      "Advantages",
      "Summary",
      "Drawings Descriptions & Num. References",
      "Detailed Description Main Embodiment",
      "Detailed Description Other Embodiment(s)",
      "Conclusions, Ramifications, Scope",
      "Brainstorm Claims & Explanations",
      "Final Claims"
    ]

    names.each do |name|
      create_component_part(name)
    end
  end  
end