# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.count == 0
	6.times do |i|
	  u = User.new(
	      :email => "email#{Time.new.usec}@domain.com",
	      :password => '12341234',
	      :first_name => "Robot",
	      :last_name => "R2D#{i}"
	  )
	  u.save!
	  FactoryGirl.create(:comment)
	end

	Idea.last.promote!
	Idea.first.promote!
end

aspect_data = [
	{
		title: "Problem that this business would solve", brief: 'For the customer segment you are working with, 
																														identify a key problem they have that the idea will solve. Explain 
																														the problem well, along with how and why the idea is a solution. 
																														You should also be sure to mention the other solutions to the problem 
																														hat currently exist, and why some people would consider the idea the 
																														best solution to the problem. If you have a better solution to someone’s 
																														problem, you should comment your solution to his problem onto his 
																														submission.'
	},
	{
		title: "Unique value proposition", brief: 'Try to distil the essence of the product into a few words; the few words that will be 
																							the headline of the landing page of the application, and that will broadcast everywhere 
																							as the idea’s brand name. In it you should answer the questions who, what, why. Make sure 
																							you are targeting the chosen customer segment with the proposition; not the mainstream. 
																							Be sure to also explain the rationale behind your UVP.'	
	},
	{
		title: "Key Metrics", brief: 'These are the key numbers that tell you how your business is doing in real time before the sales 
																	report. For tech start-ups, there are only a handful of possible numbers for this; for example 
																	traffic or particular types of activity (e.g. comments on a blog post). Document a few of these 
																	and explain why they are important and how they can help make product and market-related development 
																	decisions in the future.'
	},
	{
		title: "Unfair Advantage", brief: 'These are aspects of the product that cannot be easily reproduced or bought; this involves 
																			thinking about how to distinguish the product from competitors in the market, and make your 
																			difference matter (e.g. insider information or expertise in the field). Please be sure to 
																			briefly explain competitors’ products and how these differences will make this product better.'		
	},
	{
		title: "Channels", brief: 'This is defined as the path to the chosen customer segment. There are various characteristics to consider: 
															free channels, such as social media and blogging, or paid ones such as search engine marketing; and inbound 
															channels, relying on “pull messaging” to let customers find you (e.g. blogs, e-books and webinars), or 
															outbound channels relying on “push messaging” for you to find the customers (e.g. cold calling and 
															print/TV ads). Explain the combinations of these you will use and why you think such combinations will be 
															most effective.'
	},
	{
		title: "Cost Structure & Revenue Streams", brief: 'Revenue generally comes from product sales and advertising. Possible pricing 
																											structures are: “free trial plan”, in which you establish a time period in which the 
																											product is free, and then make users pay; or “freeniums”, where you give the product/service 
																											away for free, acquiring many users quickly, and then offer a value added premium priced 
																											product/service to the established customer base. Also take into account costs; figure out 
																											how much it costs to deliver the solution to your market segment’s problem and ensure there 
																											is a good profit margin built in. Estimate revenue and cost numbers, how long it would take 
																											to breakeven with the product’s pricing plan, and discuss any possibilities for advertising 
																											revenue streams. Explain the numbers. '
	},
	{
		title: "Customer Segments", brief: 'This is the target market of your product; a specific type of person that will most likely buy the product. 
																				Although ideas can apply to a wide range of consumers, an effective idea pinpoints an exact demographic & 
																				psycho-demographic. Distinguish between customers and users; customers will pay, users will not. It is worth 
																				explaining the demographics of each in solutions for this section.'
	},
	{
		title: "Prototype Elements", brief: 'What aspects of the product do you think are most important to be realised in the first prototype and why? 
																				If possible, explain how they should be built. '	
	},
	{
		title: "Image", brief: 'Here you can upload the image that fits the idea best; preferably one that does not infringe on any copyright laws. 
														The highest voted image will be displayed on the idea’s sidebar, and will be used as inspiration for designing the logo.'		
	}
]

Aspect.all.each do |a|
	a.destroy!
end

aspect_data.each do |d|
	Aspect.find_or_create_by(d)
end



admin_user_data = [
	{
		email: "annikamonari@gmail.com",
		first_name: "Annika",
		last_name: "Monari",
		password: "banana123",
		password_confirmation: "banana123",
		admin: true
	},
  { 
		email: "alan.vey@gmail.com",
		first_name: "Alan",
		last_name: "vey",
		password: "1234567890",
		password_confirmation: "1234567890",
		admin: true
	}
]

admin_user_data.each do |d|
	User.create(d)

	d.delete(:first_name)
	d.delete(:last_name)
	d.delete(:admin)

	AdminUser.create(d)
end





