FactoryGirl.define do 
	factory :micropost do 
		association :user

		#Add fake content with Faker	
		content { Faker::Lorem.sentences(1) }
	
	end 
end 