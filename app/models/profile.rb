class Profile < ActiveRecord::Base
  include PublicActivity::Model
	validates :user_id, presence: true
	belongs_to :user

	validates :website,
    :format => {:with => /\A#{URI::regexp(%w(http https))}\z/,
                :message => "^The website you provided is invalid.  Please make sure it starts with 'http://' or 'https://'" }, 
                :allow_blank => true,
                :allow_nil => true
    validates :age, presence: true, :allow_blank => true, :allow_nil => true
    validates :country, presence: true, length: { maximum: 20 }, :allow_blank => true, :allow_nil => true
    validates :profession, presence: true, length: { maximum: 20 }, :allow_blank => true, :allow_nil => true
    validates :about, presence: true, length: { maximum: 200 }, :allow_blank => true, :allow_nil => true

end
