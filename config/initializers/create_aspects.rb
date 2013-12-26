aspect_data = [
		{
			title: "Problem that this business would solve"
		},
		{
			title: "Unique value proposition"		
		},
		{
			title: "Key Activities"		
		},
		{
			title: "Cost structure"		
		},
		{
			title: "Unfair Advantage"		
		},
		{
			title: "Channels"		
		},
		{
			title: "Revenue Streams & Estimates"		
		},
		{
			title: "Customer Segments"		
		},
		{
			title: "Prototype Elements"		
		},
		{
			title: "Image"		
		}
	]

aspect_data.each do |d|
	Aspect.find_or_create_by(d)
end
