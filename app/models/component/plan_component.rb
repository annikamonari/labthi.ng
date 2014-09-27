class PlanComponent < Component
  
  def create_required_parts
    self.parts.create(name:"Idea Description", status:'Unstarted', button_status:'Start')
  end
end
