class PlanComponent < Component
  
  def create_required_parts
    names = [
      ["Idea Description", "4%"],
      ["Brief", "2%"]
    ]
    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
