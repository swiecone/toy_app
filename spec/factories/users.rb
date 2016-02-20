FactoryGirl.define do 
	factory :user do 

		# Generating fake name and email with Faker
		name { Faker::Name.name }
		email { Faker::Internet.email }
	end 
end
