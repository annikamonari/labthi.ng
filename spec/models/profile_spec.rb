require 'spec_helper'

describe Profile do

	let(:user) { FactoryGirl.build(:user) }
	before { @profile = FactoryGirl.build(:profile) }

	subject { @profile }

	it { should respond_to(:website) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:country) }
	it { should respond_to(:profession) }
	it { should respond_to(:age) }
	it { should respond_to(:photo) }

	it { should be_valid }

	describe "when user_id is not present" do 
		before { @profile.user_id = nil }
		it { should_not be_valid }
	end


	describe "when website format is invalid" do
		it "should be invalid" do
			websites = %w[https/www.example.com htp://ww.example.com http//www.example.com]
			websites.each do |invalid_website|
				@profile.website = invalid_website
				expect(@profile).not_to be_valid 
			end
		end
	end

	describe "when website is nil" do
		before { @profile.website = nil }
		it { should be_valid }
	end

	describe "when website is blank" do
		before { @profile.website = " " }
		it { should be_valid }
	end

	describe "when website is too long" do
		before { @profile.website = "a" * 200 }
		it { should_not be_valid }
	end

	describe "when country is nil" do
		before { @profile.country = nil }
		it { should be_valid }
	end

	describe "when country is blank" do
		before { @profile.country = " " }
		it { should be_valid }
	end

	describe "when country is too long" do
		before { @profile.country = "a" * 56 }
		it { should_not be_valid }
	end

	describe "when profession is nil" do
		before { @profile.profession = nil }
		it { should be_valid }
	end

	describe "when profession is blank" do
		before { @profile.profession = " " }
		it { should be_valid }
	end

	describe "when profession is too long" do
		before { @profile.profession = "a" * 21 }
		it { should_not be_valid }
	end

	describe "when age is nil" do
		before { @profile.age = nil }
		it { should be_valid }
	end

	describe "when about is too long" do
		before { @profile.about = "a" * 1001 }
		it { should_not be_valid }
	end

	describe "when about is blank" do
		before { @profile.about = " " }
		it { should be_valid }
	end

	describe "when about is nil" do
		before { @profile.about = nil }
		it { should be_valid }
	end
end
