FactoryBot.define do
  factory :user do
    full_name { Faker::Name.first_name }
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    gravatar_url { Faker::Avatar.image }
    password { '123456' }
  end
end
