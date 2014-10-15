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

Aspect.all.each do |a|
	a.destroy!
end

aspect_data.each do |d|
	Aspect.find_or_create_by(d)
end



admin_user_data = [
  { 
		email: "mpgarate@gmail.com",
		first_name: "Michael",
		last_name: "Garate",
		password: "banana123",
		password_confirmation: "banana123",
		admin: true
	},
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
	if AdminUser.count < 4 then
		User.create(d)

		d.delete(:first_name)
		d.delete(:last_name)
		d.delete(:admin)

		AdminUser.create(d)
	end


end
