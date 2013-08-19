require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:profile) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@example,com user_at_example.org example.user@poop poo@user_shit.com poo@shit+bull.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@example.COM A_US-ER@f.b.org frst.lst@poo.jp a+b@poo.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
  	let(:user_with_same_email) { @user.dup }
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end  

    specify { user_with_same_email.should_not be_valid }

  end

  describe "profile association" do
    it "should create a new profile with the account" do
      expect(@user.profile).to_not be_nil
    end

    it "should destroy associated profile" do
      expect {
        @user.destroy
      }.to change(Profile, :count).by(-1)
    end
  end
end
