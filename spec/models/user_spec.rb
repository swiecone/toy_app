require 'rails_helper'

# MODEL TO TEST
#----------------
# class User < ActiveRecord::Base
# 	has_many :microposts
# 	validates :name, presence: true
# 	validates :email, presence: true
# end
# ----------------


describe User do 

	it "has a valid factory" do 
		expect(build(:user)).to be_valid
	end 

	it "is not valid without name or email" do 
		user = build(:user, name: nil, email: nil)
		expect(user).not_to be_valid
	end 

	
	it "is not valid without name" do 
			user = build(:user, name: nil)
		expect(user).not_to be_valid

	end 

	it "is not valid without mail" do 
			user = build(:user, email: nil)
		expect(user).not_to be_valid
	end 


	it "is valid with mail and name" do 
			user = build(:user)
		expect(user).to be_valid
	end 

end 
