class IpComponent < Component

  def create_required_parts
    names = [
      "Advisory",
      "Preliminary Work",
      "Drawings",
      "Specification",
      "Claims"      
    ]

    names.each do |name|
      create_component_part(name)
    end
  end  
end