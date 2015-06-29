FactoryGirl.define do
	factory :user do
		email { Faker::Internet.safe_email }
		password { Faker::Internet.password }

		factory :confirmed_user do
			confirmed_at Time.zone.now
		end
	end
end
