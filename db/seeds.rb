# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.count == 0
	5.times do |i|
	  u = User.new(
	      :email => "email#{Time.new.usec}@domain.com",
	      :password => '12341234',
	      :name => "Robot R2D#{i}"
	  )
	  u.save!
	  FactoryGirl.create(:comment)
	end
end

aspect_data = [
	{
		brief: "Problems & Solutions"
	},
	{
		brief: "Key Activities"		
	},
	{
		brief: "Key Resources"		
	},
	{
		brief: "Vaue Propositions"		
	},
	{
		brief: "Customer Relationship"		
	},
	{
		brief: "Channels"		
	},
	{
		brief: "Customer Segments"		
	},
	{
		brief: "Cost Structure"		
	},
	{
		brief: "Revenue Streams"		
	}
]

aspect_data.each do |d|
	Aspect.find_or_create_by(d)
end



admin_data = [
  { 
		name: "Michael G",
		email: "mpgarate@gmail.com",
		password: "banana123",
		password_confirmation: "banana123"
	},
	{
		name: "Annika M",
		email: "annikamonari@gmail.com",
		password: "banana123",
		password_confirmation: "banana123"
	},
	{
		name: "Emily P",
		email: "emily.pakulski@gmail.com",
		password: "banana123",
		password_confirmation: "banana123"
	}
]

admin_data.each do |d|
	FactoryGirl.create(:admin, d) unless Admin.where(d)
end