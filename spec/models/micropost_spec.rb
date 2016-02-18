require 'rails_helper'

describe Micropost do 
	it "has a valid factory" do 
		expect(FactoryGirl.build(:micropost)).to be_valid
	end 

	it "is not valid with content > 140 chars" do 
		long_content = "A" * 141
		micropost = Micropost.create(
			content: long_content,
			user_id: 1)
		expect(micropost).not_to be_valid
	end 
	
	it "is not valid with content < 2 chars" do 
		short_content = "B" * 1
		micropost = Micropost.create(
			content: short_content,
			user_id: 1)
		expect(micropost).not_to be_valid
	end 

	it "is valid with content > 2 chars and < 140 chars" do 
		ok_content = "C" * 10
		micropost = Micropost.create(
			content: ok_content,
			user_id: 1)
		expect(micropost).to be_valid
	end 

	it "is not valid without content" do 
		micropost = Micropost.create(
			content: nil,
			user_id: 1)
		expect(micropost).not_to be_valid
	end 
end 
