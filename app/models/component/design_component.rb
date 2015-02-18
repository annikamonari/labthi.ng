class DesignComponent < Component
  
  def create_required_parts
    if self.idea_build.idea.kind == 'Software Product'
      names = [['Wireframes and User Flow', '10%'], 
               ['Database Design', '10%'],
               ['Branding', '10%']]
    else
      names = [['Concept Sketches', '10%'], ['CAD', '10%'], ['Branding', '10%']]
    end

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
