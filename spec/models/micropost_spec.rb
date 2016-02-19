require 'rails_helper'

describe Micropost do 
	it "has a valid factory" do 
		expect(build(:micropost)).to be_valid
	end 

	it "is not valid with content > 140 chars" do 
		long_content = "A" * 141
		micropost = build(:micropost, content: long_content)
		expect(micropost).not_to be_valid
	end 
	
	it "is not valid with content < 2 chars" do 
		short_content = "B" * 1
		micropost = build(:micropost, content: short_content)
		expect(micropost).not_to be_valid
	end 

	it "is valid with content > 2 chars and < 140 chars" do 
		ok_content = "C" * 10
		micropost = build(:micropost)
		expect(micropost).to be_valid
	end 

	it "is not valid without content" do 
		micropost = build(:micropost, content: nil)
		expect(micropost).not_to be_valid
	end 
end 
