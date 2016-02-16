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
	it "is not valid without name or email" do 
		user = User.create(
			name: nil,
			email: nil )
		expect(user).not_to be_valid
	end 

	
	it "is not valid without name" do 
			user = User.create(
			name: nil,
			email: "Alex@gmail.com")
		expect(user).not_to be_valid

	end 

	it "is not valid without mail" do 
			user = User.create(
			name: "Alex",
			email: nil)
		expect(user).not_to be_valid
	end 


	it "is valid with mail and name" do 
			user = User.create(
			name: "Alex",
			email: "alex@example.com")
		expect(user).to be_valid
	end 

end 
