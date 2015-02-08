class PlanComponent < Component
  
  def create_required_parts
    names = [['Brief', '10%'], 
             ['Product Specification', '10%'],
             ['Management Specification', '10%']
            ]

    names.each do |name, equity|
      self.parts.create(name:name, status:'Unstarted', equity:equity)
    end
  end
end
