class PrototypeComponent < Component
  
  def create_required_parts
    if self.idea_build.idea.kind == 'Software Product'
      names = [["Design Prototype and User Testing", "10%"], 
               ['Functional Prototype and Test Suite', '10%']]
    else
      names = [['A', '10%'], ['B', '10%']]
    end

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
