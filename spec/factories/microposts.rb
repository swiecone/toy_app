FactoryGirl.define do 
	factory :micropost do 
		association :user
		content "AAAAAAAAAAAAAAA"
	end 
end 